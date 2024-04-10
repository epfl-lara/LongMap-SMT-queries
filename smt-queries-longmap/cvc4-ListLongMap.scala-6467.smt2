; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82646 () Bool)

(assert start!82646)

(declare-fun b_free!18779 () Bool)

(declare-fun b_next!18779 () Bool)

(assert (=> start!82646 (= b_free!18779 (not b_next!18779))))

(declare-fun tp!65457 () Bool)

(declare-fun b_and!30267 () Bool)

(assert (=> start!82646 (= tp!65457 b_and!30267)))

(declare-fun b!963426 () Bool)

(declare-fun res!644788 () Bool)

(declare-fun e!543226 () Bool)

(assert (=> b!963426 (=> (not res!644788) (not e!543226))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963426 (= res!644788 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963427 () Bool)

(declare-fun res!644789 () Bool)

(assert (=> b!963427 (=> (not res!644789) (not e!543226))))

(declare-datatypes ((array!59257 0))(
  ( (array!59258 (arr!28497 (Array (_ BitVec 32) (_ BitVec 64))) (size!28976 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59257)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963427 (= res!644789 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28976 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28976 _keys!1686))))))

(declare-fun b!963428 () Bool)

(declare-fun res!644785 () Bool)

(assert (=> b!963428 (=> (not res!644785) (not e!543226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963428 (= res!644785 (validKeyInArray!0 (select (arr!28497 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34366 () Bool)

(declare-fun mapRes!34366 () Bool)

(declare-fun tp!65456 () Bool)

(declare-fun e!543228 () Bool)

(assert (=> mapNonEmpty!34366 (= mapRes!34366 (and tp!65456 e!543228))))

(declare-datatypes ((V!33757 0))(
  ( (V!33758 (val!10841 Int)) )
))
(declare-datatypes ((ValueCell!10309 0))(
  ( (ValueCellFull!10309 (v!13399 V!33757)) (EmptyCell!10309) )
))
(declare-datatypes ((array!59259 0))(
  ( (array!59260 (arr!28498 (Array (_ BitVec 32) ValueCell!10309)) (size!28977 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59259)

(declare-fun mapValue!34366 () ValueCell!10309)

(declare-fun mapRest!34366 () (Array (_ BitVec 32) ValueCell!10309))

(declare-fun mapKey!34366 () (_ BitVec 32))

(assert (=> mapNonEmpty!34366 (= (arr!28498 _values!1400) (store mapRest!34366 mapKey!34366 mapValue!34366))))

(declare-fun mapIsEmpty!34366 () Bool)

(assert (=> mapIsEmpty!34366 mapRes!34366))

(declare-fun b!963429 () Bool)

(declare-fun res!644784 () Bool)

(assert (=> b!963429 (=> (not res!644784) (not e!543226))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963429 (= res!644784 (and (= (size!28977 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28976 _keys!1686) (size!28977 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963431 () Bool)

(declare-fun res!644791 () Bool)

(assert (=> b!963431 (=> (not res!644791) (not e!543226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59257 (_ BitVec 32)) Bool)

(assert (=> b!963431 (= res!644791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963432 () Bool)

(declare-fun e!543229 () Bool)

(declare-fun tp_is_empty!21581 () Bool)

(assert (=> b!963432 (= e!543229 tp_is_empty!21581)))

(declare-fun b!963433 () Bool)

(assert (=> b!963433 (= e!543226 (not true))))

(declare-fun minValue!1342 () V!33757)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33757)

(declare-datatypes ((tuple2!13928 0))(
  ( (tuple2!13929 (_1!6975 (_ BitVec 64)) (_2!6975 V!33757)) )
))
(declare-datatypes ((List!19779 0))(
  ( (Nil!19776) (Cons!19775 (h!20937 tuple2!13928) (t!28142 List!19779)) )
))
(declare-datatypes ((ListLongMap!12625 0))(
  ( (ListLongMap!12626 (toList!6328 List!19779)) )
))
(declare-fun contains!5431 (ListLongMap!12625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3561 (array!59257 array!59259 (_ BitVec 32) (_ BitVec 32) V!33757 V!33757 (_ BitVec 32) Int) ListLongMap!12625)

(assert (=> b!963433 (contains!5431 (getCurrentListMap!3561 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28497 _keys!1686) i!803))))

(declare-datatypes ((Unit!32239 0))(
  ( (Unit!32240) )
))
(declare-fun lt!430972 () Unit!32239)

(declare-fun lemmaInListMapFromThenInFromMinusOne!14 (array!59257 array!59259 (_ BitVec 32) (_ BitVec 32) V!33757 V!33757 (_ BitVec 32) (_ BitVec 32) Int) Unit!32239)

(assert (=> b!963433 (= lt!430972 (lemmaInListMapFromThenInFromMinusOne!14 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963434 () Bool)

(declare-fun e!543227 () Bool)

(assert (=> b!963434 (= e!543227 (and e!543229 mapRes!34366))))

(declare-fun condMapEmpty!34366 () Bool)

(declare-fun mapDefault!34366 () ValueCell!10309)

