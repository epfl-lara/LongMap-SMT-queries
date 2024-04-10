; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108170 () Bool)

(assert start!108170)

(declare-fun b_free!27865 () Bool)

(declare-fun b_next!27865 () Bool)

(assert (=> start!108170 (= b_free!27865 (not b_next!27865))))

(declare-fun tp!98551 () Bool)

(declare-fun b_and!45923 () Bool)

(assert (=> start!108170 (= tp!98551 b_and!45923)))

(declare-fun b!1277382 () Bool)

(declare-fun e!729503 () Bool)

(declare-fun tp_is_empty!33415 () Bool)

(assert (=> b!1277382 (= e!729503 tp_is_empty!33415)))

(declare-fun b!1277383 () Bool)

(declare-fun res!848796 () Bool)

(declare-fun e!729500 () Bool)

(assert (=> b!1277383 (=> (not res!848796) (not e!729500))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83924 0))(
  ( (array!83925 (arr!40472 (Array (_ BitVec 32) (_ BitVec 64))) (size!41022 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83924)

(declare-datatypes ((V!49657 0))(
  ( (V!49658 (val!16782 Int)) )
))
(declare-datatypes ((ValueCell!15809 0))(
  ( (ValueCellFull!15809 (v!19380 V!49657)) (EmptyCell!15809) )
))
(declare-datatypes ((array!83926 0))(
  ( (array!83927 (arr!40473 (Array (_ BitVec 32) ValueCell!15809)) (size!41023 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83926)

(assert (=> b!1277383 (= res!848796 (and (= (size!41023 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41022 _keys!1427) (size!41023 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51656 () Bool)

(declare-fun mapRes!51656 () Bool)

(declare-fun tp!98552 () Bool)

(declare-fun e!729502 () Bool)

(assert (=> mapNonEmpty!51656 (= mapRes!51656 (and tp!98552 e!729502))))

(declare-fun mapKey!51656 () (_ BitVec 32))

(declare-fun mapValue!51656 () ValueCell!15809)

(declare-fun mapRest!51656 () (Array (_ BitVec 32) ValueCell!15809))

(assert (=> mapNonEmpty!51656 (= (arr!40473 _values!1187) (store mapRest!51656 mapKey!51656 mapValue!51656))))

(declare-fun mapIsEmpty!51656 () Bool)

(assert (=> mapIsEmpty!51656 mapRes!51656))

(declare-fun res!848798 () Bool)

(assert (=> start!108170 (=> (not res!848798) (not e!729500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108170 (= res!848798 (validMask!0 mask!1805))))

(assert (=> start!108170 e!729500))

(assert (=> start!108170 true))

(assert (=> start!108170 tp!98551))

(assert (=> start!108170 tp_is_empty!33415))

(declare-fun e!729501 () Bool)

(declare-fun array_inv!30749 (array!83926) Bool)

(assert (=> start!108170 (and (array_inv!30749 _values!1187) e!729501)))

(declare-fun array_inv!30750 (array!83924) Bool)

(assert (=> start!108170 (array_inv!30750 _keys!1427)))

(declare-fun b!1277384 () Bool)

(declare-fun res!848797 () Bool)

(assert (=> b!1277384 (=> (not res!848797) (not e!729500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83924 (_ BitVec 32)) Bool)

(assert (=> b!1277384 (= res!848797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277385 () Bool)

(assert (=> b!1277385 (= e!729501 (and e!729503 mapRes!51656))))

(declare-fun condMapEmpty!51656 () Bool)

(declare-fun mapDefault!51656 () ValueCell!15809)

