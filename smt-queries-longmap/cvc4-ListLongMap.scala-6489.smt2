; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82778 () Bool)

(assert start!82778)

(declare-fun b_free!18911 () Bool)

(declare-fun b_next!18911 () Bool)

(assert (=> start!82778 (= b_free!18911 (not b_next!18911))))

(declare-fun tp!65852 () Bool)

(declare-fun b_and!30399 () Bool)

(assert (=> start!82778 (= tp!65852 b_and!30399)))

(declare-fun b!965543 () Bool)

(declare-fun e!544301 () Bool)

(declare-fun tp_is_empty!21713 () Bool)

(assert (=> b!965543 (= e!544301 tp_is_empty!21713)))

(declare-fun mapIsEmpty!34564 () Bool)

(declare-fun mapRes!34564 () Bool)

(assert (=> mapIsEmpty!34564 mapRes!34564))

(declare-fun b!965544 () Bool)

(declare-fun res!646309 () Bool)

(declare-fun e!544300 () Bool)

(assert (=> b!965544 (=> (not res!646309) (not e!544300))))

(declare-datatypes ((array!59511 0))(
  ( (array!59512 (arr!28624 (Array (_ BitVec 32) (_ BitVec 64))) (size!29103 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59511)

(declare-datatypes ((List!19872 0))(
  ( (Nil!19869) (Cons!19868 (h!21030 (_ BitVec 64)) (t!28235 List!19872)) )
))
(declare-fun arrayNoDuplicates!0 (array!59511 (_ BitVec 32) List!19872) Bool)

(assert (=> b!965544 (= res!646309 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19869))))

(declare-fun b!965545 () Bool)

(declare-fun res!646307 () Bool)

(assert (=> b!965545 (=> (not res!646307) (not e!544300))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965545 (= res!646307 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29103 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29103 _keys!1686))))))

(declare-fun res!646312 () Bool)

(assert (=> start!82778 (=> (not res!646312) (not e!544300))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82778 (= res!646312 (validMask!0 mask!2110))))

(assert (=> start!82778 e!544300))

(assert (=> start!82778 true))

(declare-datatypes ((V!33933 0))(
  ( (V!33934 (val!10907 Int)) )
))
(declare-datatypes ((ValueCell!10375 0))(
  ( (ValueCellFull!10375 (v!13465 V!33933)) (EmptyCell!10375) )
))
(declare-datatypes ((array!59513 0))(
  ( (array!59514 (arr!28625 (Array (_ BitVec 32) ValueCell!10375)) (size!29104 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59513)

(declare-fun e!544299 () Bool)

(declare-fun array_inv!22169 (array!59513) Bool)

(assert (=> start!82778 (and (array_inv!22169 _values!1400) e!544299)))

(declare-fun array_inv!22170 (array!59511) Bool)

(assert (=> start!82778 (array_inv!22170 _keys!1686)))

(assert (=> start!82778 tp!65852))

(assert (=> start!82778 tp_is_empty!21713))

(declare-fun b!965546 () Bool)

(declare-fun res!646308 () Bool)

(assert (=> b!965546 (=> (not res!646308) (not e!544300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965546 (= res!646308 (validKeyInArray!0 (select (arr!28624 _keys!1686) i!803)))))

(declare-fun b!965547 () Bool)

(declare-fun res!646310 () Bool)

(assert (=> b!965547 (=> (not res!646310) (not e!544300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59511 (_ BitVec 32)) Bool)

(assert (=> b!965547 (= res!646310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34564 () Bool)

(declare-fun tp!65853 () Bool)

(declare-fun e!544298 () Bool)

(assert (=> mapNonEmpty!34564 (= mapRes!34564 (and tp!65853 e!544298))))

(declare-fun mapRest!34564 () (Array (_ BitVec 32) ValueCell!10375))

(declare-fun mapKey!34564 () (_ BitVec 32))

(declare-fun mapValue!34564 () ValueCell!10375)

(assert (=> mapNonEmpty!34564 (= (arr!28625 _values!1400) (store mapRest!34564 mapKey!34564 mapValue!34564))))

(declare-fun b!965548 () Bool)

(assert (=> b!965548 (= e!544300 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431251 () Bool)

(declare-fun minValue!1342 () V!33933)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33933)

(declare-datatypes ((tuple2!14030 0))(
  ( (tuple2!14031 (_1!7026 (_ BitVec 64)) (_2!7026 V!33933)) )
))
(declare-datatypes ((List!19873 0))(
  ( (Nil!19870) (Cons!19869 (h!21031 tuple2!14030) (t!28236 List!19873)) )
))
(declare-datatypes ((ListLongMap!12727 0))(
  ( (ListLongMap!12728 (toList!6379 List!19873)) )
))
(declare-fun contains!5482 (ListLongMap!12727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3612 (array!59511 array!59513 (_ BitVec 32) (_ BitVec 32) V!33933 V!33933 (_ BitVec 32) Int) ListLongMap!12727)

(assert (=> b!965548 (= lt!431251 (contains!5482 (getCurrentListMap!3612 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28624 _keys!1686) i!803)))))

(declare-fun b!965549 () Bool)

(assert (=> b!965549 (= e!544299 (and e!544301 mapRes!34564))))

(declare-fun condMapEmpty!34564 () Bool)

(declare-fun mapDefault!34564 () ValueCell!10375)

