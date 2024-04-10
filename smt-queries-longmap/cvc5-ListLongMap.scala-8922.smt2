; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108200 () Bool)

(assert start!108200)

(declare-fun b_free!27895 () Bool)

(declare-fun b_next!27895 () Bool)

(assert (=> start!108200 (= b_free!27895 (not b_next!27895))))

(declare-fun tp!98641 () Bool)

(declare-fun b_and!45953 () Bool)

(assert (=> start!108200 (= tp!98641 b_and!45953)))

(declare-fun b!1277697 () Bool)

(declare-fun e!729728 () Bool)

(declare-fun tp_is_empty!33445 () Bool)

(assert (=> b!1277697 (= e!729728 tp_is_empty!33445)))

(declare-fun mapIsEmpty!51701 () Bool)

(declare-fun mapRes!51701 () Bool)

(assert (=> mapIsEmpty!51701 mapRes!51701))

(declare-fun b!1277699 () Bool)

(declare-fun e!729725 () Bool)

(assert (=> b!1277699 (= e!729725 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575734 () Bool)

(declare-datatypes ((V!49697 0))(
  ( (V!49698 (val!16797 Int)) )
))
(declare-fun minValue!1129 () V!49697)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15824 0))(
  ( (ValueCellFull!15824 (v!19395 V!49697)) (EmptyCell!15824) )
))
(declare-datatypes ((array!83982 0))(
  ( (array!83983 (arr!40501 (Array (_ BitVec 32) ValueCell!15824)) (size!41051 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83982)

(declare-fun zeroValue!1129 () V!49697)

(declare-datatypes ((array!83984 0))(
  ( (array!83985 (arr!40502 (Array (_ BitVec 32) (_ BitVec 64))) (size!41052 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83984)

(declare-datatypes ((tuple2!21544 0))(
  ( (tuple2!21545 (_1!10783 (_ BitVec 64)) (_2!10783 V!49697)) )
))
(declare-datatypes ((List!28721 0))(
  ( (Nil!28718) (Cons!28717 (h!29926 tuple2!21544) (t!42259 List!28721)) )
))
(declare-datatypes ((ListLongMap!19201 0))(
  ( (ListLongMap!19202 (toList!9616 List!28721)) )
))
(declare-fun contains!7726 (ListLongMap!19201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4700 (array!83984 array!83982 (_ BitVec 32) (_ BitVec 32) V!49697 V!49697 (_ BitVec 32) Int) ListLongMap!19201)

(assert (=> b!1277699 (= lt!575734 (contains!7726 (getCurrentListMap!4700 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277700 () Bool)

(declare-fun res!848979 () Bool)

(assert (=> b!1277700 (=> (not res!848979) (not e!729725))))

(declare-datatypes ((List!28722 0))(
  ( (Nil!28719) (Cons!28718 (h!29927 (_ BitVec 64)) (t!42260 List!28722)) )
))
(declare-fun arrayNoDuplicates!0 (array!83984 (_ BitVec 32) List!28722) Bool)

(assert (=> b!1277700 (= res!848979 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28719))))

(declare-fun b!1277701 () Bool)

(declare-fun res!848976 () Bool)

(assert (=> b!1277701 (=> (not res!848976) (not e!729725))))

(assert (=> b!1277701 (= res!848976 (and (= (size!41051 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41052 _keys!1427) (size!41051 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277702 () Bool)

(declare-fun e!729727 () Bool)

(assert (=> b!1277702 (= e!729727 tp_is_empty!33445)))

(declare-fun mapNonEmpty!51701 () Bool)

(declare-fun tp!98642 () Bool)

(assert (=> mapNonEmpty!51701 (= mapRes!51701 (and tp!98642 e!729727))))

(declare-fun mapValue!51701 () ValueCell!15824)

(declare-fun mapRest!51701 () (Array (_ BitVec 32) ValueCell!15824))

(declare-fun mapKey!51701 () (_ BitVec 32))

(assert (=> mapNonEmpty!51701 (= (arr!40501 _values!1187) (store mapRest!51701 mapKey!51701 mapValue!51701))))

(declare-fun b!1277703 () Bool)

(declare-fun e!729729 () Bool)

(assert (=> b!1277703 (= e!729729 (and e!729728 mapRes!51701))))

(declare-fun condMapEmpty!51701 () Bool)

(declare-fun mapDefault!51701 () ValueCell!15824)

