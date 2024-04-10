; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82750 () Bool)

(assert start!82750)

(declare-fun b_free!18883 () Bool)

(declare-fun b_next!18883 () Bool)

(assert (=> start!82750 (= b_free!18883 (not b_next!18883))))

(declare-fun tp!65768 () Bool)

(declare-fun b_and!30371 () Bool)

(assert (=> start!82750 (= tp!65768 b_and!30371)))

(declare-fun mapIsEmpty!34522 () Bool)

(declare-fun mapRes!34522 () Bool)

(assert (=> mapIsEmpty!34522 mapRes!34522))

(declare-fun b!965165 () Bool)

(declare-fun res!646056 () Bool)

(declare-fun e!544088 () Bool)

(assert (=> b!965165 (=> (not res!646056) (not e!544088))))

(declare-datatypes ((array!59455 0))(
  ( (array!59456 (arr!28596 (Array (_ BitVec 32) (_ BitVec 64))) (size!29075 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59455)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59455 (_ BitVec 32)) Bool)

(assert (=> b!965165 (= res!646056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965166 () Bool)

(declare-fun res!646059 () Bool)

(assert (=> b!965166 (=> (not res!646059) (not e!544088))))

(declare-datatypes ((List!19846 0))(
  ( (Nil!19843) (Cons!19842 (h!21004 (_ BitVec 64)) (t!28209 List!19846)) )
))
(declare-fun arrayNoDuplicates!0 (array!59455 (_ BitVec 32) List!19846) Bool)

(assert (=> b!965166 (= res!646059 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19843))))

(declare-fun res!646060 () Bool)

(assert (=> start!82750 (=> (not res!646060) (not e!544088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82750 (= res!646060 (validMask!0 mask!2110))))

(assert (=> start!82750 e!544088))

(assert (=> start!82750 true))

(declare-datatypes ((V!33897 0))(
  ( (V!33898 (val!10893 Int)) )
))
(declare-datatypes ((ValueCell!10361 0))(
  ( (ValueCellFull!10361 (v!13451 V!33897)) (EmptyCell!10361) )
))
(declare-datatypes ((array!59457 0))(
  ( (array!59458 (arr!28597 (Array (_ BitVec 32) ValueCell!10361)) (size!29076 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59457)

(declare-fun e!544090 () Bool)

(declare-fun array_inv!22145 (array!59457) Bool)

(assert (=> start!82750 (and (array_inv!22145 _values!1400) e!544090)))

(declare-fun array_inv!22146 (array!59455) Bool)

(assert (=> start!82750 (array_inv!22146 _keys!1686)))

(assert (=> start!82750 tp!65768))

(declare-fun tp_is_empty!21685 () Bool)

(assert (=> start!82750 tp_is_empty!21685))

(declare-fun b!965167 () Bool)

(assert (=> b!965167 (= e!544088 false)))

(declare-fun minValue!1342 () V!33897)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431209 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33897)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14002 0))(
  ( (tuple2!14003 (_1!7012 (_ BitVec 64)) (_2!7012 V!33897)) )
))
(declare-datatypes ((List!19847 0))(
  ( (Nil!19844) (Cons!19843 (h!21005 tuple2!14002) (t!28210 List!19847)) )
))
(declare-datatypes ((ListLongMap!12699 0))(
  ( (ListLongMap!12700 (toList!6365 List!19847)) )
))
(declare-fun contains!5468 (ListLongMap!12699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3598 (array!59455 array!59457 (_ BitVec 32) (_ BitVec 32) V!33897 V!33897 (_ BitVec 32) Int) ListLongMap!12699)

(assert (=> b!965167 (= lt!431209 (contains!5468 (getCurrentListMap!3598 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28596 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34522 () Bool)

(declare-fun tp!65769 () Bool)

(declare-fun e!544087 () Bool)

(assert (=> mapNonEmpty!34522 (= mapRes!34522 (and tp!65769 e!544087))))

(declare-fun mapRest!34522 () (Array (_ BitVec 32) ValueCell!10361))

(declare-fun mapValue!34522 () ValueCell!10361)

(declare-fun mapKey!34522 () (_ BitVec 32))

(assert (=> mapNonEmpty!34522 (= (arr!28597 _values!1400) (store mapRest!34522 mapKey!34522 mapValue!34522))))

(declare-fun b!965168 () Bool)

(declare-fun e!544091 () Bool)

(assert (=> b!965168 (= e!544091 tp_is_empty!21685)))

(declare-fun b!965169 () Bool)

(declare-fun res!646057 () Bool)

(assert (=> b!965169 (=> (not res!646057) (not e!544088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965169 (= res!646057 (validKeyInArray!0 (select (arr!28596 _keys!1686) i!803)))))

(declare-fun b!965170 () Bool)

(declare-fun res!646058 () Bool)

(assert (=> b!965170 (=> (not res!646058) (not e!544088))))

(assert (=> b!965170 (= res!646058 (and (= (size!29076 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29075 _keys!1686) (size!29076 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965171 () Bool)

(declare-fun res!646055 () Bool)

(assert (=> b!965171 (=> (not res!646055) (not e!544088))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965171 (= res!646055 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29075 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29075 _keys!1686))))))

(declare-fun b!965172 () Bool)

(assert (=> b!965172 (= e!544090 (and e!544091 mapRes!34522))))

(declare-fun condMapEmpty!34522 () Bool)

(declare-fun mapDefault!34522 () ValueCell!10361)

