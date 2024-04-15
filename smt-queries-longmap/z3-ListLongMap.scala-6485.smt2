; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82732 () Bool)

(assert start!82732)

(declare-fun b_free!18883 () Bool)

(declare-fun b_next!18883 () Bool)

(assert (=> start!82732 (= b_free!18883 (not b_next!18883))))

(declare-fun tp!65769 () Bool)

(declare-fun b_and!30345 () Bool)

(assert (=> start!82732 (= tp!65769 b_and!30345)))

(declare-fun mapNonEmpty!34522 () Bool)

(declare-fun mapRes!34522 () Bool)

(declare-fun tp!65770 () Bool)

(declare-fun e!543941 () Bool)

(assert (=> mapNonEmpty!34522 (= mapRes!34522 (and tp!65770 e!543941))))

(declare-datatypes ((V!33897 0))(
  ( (V!33898 (val!10893 Int)) )
))
(declare-datatypes ((ValueCell!10361 0))(
  ( (ValueCellFull!10361 (v!13450 V!33897)) (EmptyCell!10361) )
))
(declare-fun mapRest!34522 () (Array (_ BitVec 32) ValueCell!10361))

(declare-datatypes ((array!59392 0))(
  ( (array!59393 (arr!28565 (Array (_ BitVec 32) ValueCell!10361)) (size!29046 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59392)

(declare-fun mapKey!34522 () (_ BitVec 32))

(declare-fun mapValue!34522 () ValueCell!10361)

(assert (=> mapNonEmpty!34522 (= (arr!28565 _values!1400) (store mapRest!34522 mapKey!34522 mapValue!34522))))

(declare-fun b!964926 () Bool)

(declare-fun res!645949 () Bool)

(declare-fun e!543939 () Bool)

(assert (=> b!964926 (=> (not res!645949) (not e!543939))))

(declare-datatypes ((array!59394 0))(
  ( (array!59395 (arr!28566 (Array (_ BitVec 32) (_ BitVec 64))) (size!29047 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59394)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964926 (= res!645949 (validKeyInArray!0 (select (arr!28566 _keys!1686) i!803)))))

(declare-fun b!964927 () Bool)

(assert (=> b!964927 (= e!543939 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!430973 () Bool)

(declare-fun minValue!1342 () V!33897)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33897)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14074 0))(
  ( (tuple2!14075 (_1!7048 (_ BitVec 64)) (_2!7048 V!33897)) )
))
(declare-datatypes ((List!19881 0))(
  ( (Nil!19878) (Cons!19877 (h!21039 tuple2!14074) (t!28235 List!19881)) )
))
(declare-datatypes ((ListLongMap!12761 0))(
  ( (ListLongMap!12762 (toList!6396 List!19881)) )
))
(declare-fun contains!5443 (ListLongMap!12761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3558 (array!59394 array!59392 (_ BitVec 32) (_ BitVec 32) V!33897 V!33897 (_ BitVec 32) Int) ListLongMap!12761)

(assert (=> b!964927 (= lt!430973 (contains!5443 (getCurrentListMap!3558 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28566 _keys!1686) i!803)))))

(declare-fun b!964928 () Bool)

(declare-fun tp_is_empty!21685 () Bool)

(assert (=> b!964928 (= e!543941 tp_is_empty!21685)))

(declare-fun res!645947 () Bool)

(assert (=> start!82732 (=> (not res!645947) (not e!543939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82732 (= res!645947 (validMask!0 mask!2110))))

(assert (=> start!82732 e!543939))

(assert (=> start!82732 true))

(declare-fun e!543943 () Bool)

(declare-fun array_inv!22181 (array!59392) Bool)

(assert (=> start!82732 (and (array_inv!22181 _values!1400) e!543943)))

(declare-fun array_inv!22182 (array!59394) Bool)

(assert (=> start!82732 (array_inv!22182 _keys!1686)))

(assert (=> start!82732 tp!65769))

(assert (=> start!82732 tp_is_empty!21685))

(declare-fun b!964929 () Bool)

(declare-fun e!543940 () Bool)

(assert (=> b!964929 (= e!543940 tp_is_empty!21685)))

(declare-fun b!964930 () Bool)

(declare-fun res!645948 () Bool)

(assert (=> b!964930 (=> (not res!645948) (not e!543939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59394 (_ BitVec 32)) Bool)

(assert (=> b!964930 (= res!645948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964931 () Bool)

(declare-fun res!645950 () Bool)

(assert (=> b!964931 (=> (not res!645950) (not e!543939))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964931 (= res!645950 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29047 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29047 _keys!1686))))))

(declare-fun b!964932 () Bool)

(assert (=> b!964932 (= e!543943 (and e!543940 mapRes!34522))))

(declare-fun condMapEmpty!34522 () Bool)

(declare-fun mapDefault!34522 () ValueCell!10361)

(assert (=> b!964932 (= condMapEmpty!34522 (= (arr!28565 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10361)) mapDefault!34522)))))

(declare-fun mapIsEmpty!34522 () Bool)

(assert (=> mapIsEmpty!34522 mapRes!34522))

(declare-fun b!964933 () Bool)

(declare-fun res!645946 () Bool)

(assert (=> b!964933 (=> (not res!645946) (not e!543939))))

(declare-datatypes ((List!19882 0))(
  ( (Nil!19879) (Cons!19878 (h!21040 (_ BitVec 64)) (t!28236 List!19882)) )
))
(declare-fun arrayNoDuplicates!0 (array!59394 (_ BitVec 32) List!19882) Bool)

(assert (=> b!964933 (= res!645946 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19879))))

(declare-fun b!964934 () Bool)

(declare-fun res!645945 () Bool)

(assert (=> b!964934 (=> (not res!645945) (not e!543939))))

(assert (=> b!964934 (= res!645945 (and (= (size!29046 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29047 _keys!1686) (size!29046 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82732 res!645947) b!964934))

(assert (= (and b!964934 res!645945) b!964930))

(assert (= (and b!964930 res!645948) b!964933))

(assert (= (and b!964933 res!645946) b!964931))

(assert (= (and b!964931 res!645950) b!964926))

(assert (= (and b!964926 res!645949) b!964927))

(assert (= (and b!964932 condMapEmpty!34522) mapIsEmpty!34522))

(assert (= (and b!964932 (not condMapEmpty!34522)) mapNonEmpty!34522))

(get-info :version)

(assert (= (and mapNonEmpty!34522 ((_ is ValueCellFull!10361) mapValue!34522)) b!964928))

(assert (= (and b!964932 ((_ is ValueCellFull!10361) mapDefault!34522)) b!964929))

(assert (= start!82732 b!964932))

(declare-fun m!893551 () Bool)

(assert (=> b!964926 m!893551))

(assert (=> b!964926 m!893551))

(declare-fun m!893553 () Bool)

(assert (=> b!964926 m!893553))

(declare-fun m!893555 () Bool)

(assert (=> start!82732 m!893555))

(declare-fun m!893557 () Bool)

(assert (=> start!82732 m!893557))

(declare-fun m!893559 () Bool)

(assert (=> start!82732 m!893559))

(declare-fun m!893561 () Bool)

(assert (=> b!964933 m!893561))

(declare-fun m!893563 () Bool)

(assert (=> b!964927 m!893563))

(assert (=> b!964927 m!893551))

(assert (=> b!964927 m!893563))

(assert (=> b!964927 m!893551))

(declare-fun m!893565 () Bool)

(assert (=> b!964927 m!893565))

(declare-fun m!893567 () Bool)

(assert (=> mapNonEmpty!34522 m!893567))

(declare-fun m!893569 () Bool)

(assert (=> b!964930 m!893569))

(check-sat (not b!964930) (not b_next!18883) tp_is_empty!21685 (not b!964927) (not b!964926) b_and!30345 (not b!964933) (not mapNonEmpty!34522) (not start!82732))
(check-sat b_and!30345 (not b_next!18883))
