; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112296 () Bool)

(assert start!112296)

(declare-fun b_free!30691 () Bool)

(declare-fun b_next!30691 () Bool)

(assert (=> start!112296 (= b_free!30691 (not b_next!30691))))

(declare-fun tp!107710 () Bool)

(declare-fun b_and!49437 () Bool)

(assert (=> start!112296 (= tp!107710 b_and!49437)))

(declare-fun b!1330691 () Bool)

(declare-fun e!758386 () Bool)

(assert (=> b!1330691 (= e!758386 (not true))))

(declare-datatypes ((V!53905 0))(
  ( (V!53906 (val!18375 Int)) )
))
(declare-datatypes ((tuple2!23664 0))(
  ( (tuple2!23665 (_1!11843 (_ BitVec 64)) (_2!11843 V!53905)) )
))
(declare-datatypes ((List!30814 0))(
  ( (Nil!30811) (Cons!30810 (h!32019 tuple2!23664) (t!44918 List!30814)) )
))
(declare-datatypes ((ListLongMap!21321 0))(
  ( (ListLongMap!21322 (toList!10676 List!30814)) )
))
(declare-fun lt!591244 () ListLongMap!21321)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8840 (ListLongMap!21321 (_ BitVec 64)) Bool)

(assert (=> b!1330691 (contains!8840 lt!591244 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591242 () V!53905)

(declare-datatypes ((array!90086 0))(
  ( (array!90087 (arr!43509 (Array (_ BitVec 32) (_ BitVec 64))) (size!44059 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90086)

(declare-datatypes ((Unit!43795 0))(
  ( (Unit!43796) )
))
(declare-fun lt!591240 () Unit!43795)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!260 ((_ BitVec 64) (_ BitVec 64) V!53905 ListLongMap!21321) Unit!43795)

(assert (=> b!1330691 (= lt!591240 (lemmaInListMapAfterAddingDiffThenInBefore!260 k!1153 (select (arr!43509 _keys!1590) from!1980) lt!591242 lt!591244))))

(declare-fun lt!591241 () ListLongMap!21321)

(assert (=> b!1330691 (contains!8840 lt!591241 k!1153)))

(declare-fun lt!591243 () Unit!43795)

(declare-fun minValue!1262 () V!53905)

(assert (=> b!1330691 (= lt!591243 (lemmaInListMapAfterAddingDiffThenInBefore!260 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591241))))

(declare-fun +!4673 (ListLongMap!21321 tuple2!23664) ListLongMap!21321)

(assert (=> b!1330691 (= lt!591241 (+!4673 lt!591244 (tuple2!23665 (select (arr!43509 _keys!1590) from!1980) lt!591242)))))

(declare-datatypes ((ValueCell!17402 0))(
  ( (ValueCellFull!17402 (v!21012 V!53905)) (EmptyCell!17402) )
))
(declare-datatypes ((array!90088 0))(
  ( (array!90089 (arr!43510 (Array (_ BitVec 32) ValueCell!17402)) (size!44060 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90088)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21933 (ValueCell!17402 V!53905) V!53905)

(declare-fun dynLambda!3612 (Int (_ BitVec 64)) V!53905)

(assert (=> b!1330691 (= lt!591242 (get!21933 (select (arr!43510 _values!1320) from!1980) (dynLambda!3612 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53905)

(declare-fun getCurrentListMapNoExtraKeys!6311 (array!90086 array!90088 (_ BitVec 32) (_ BitVec 32) V!53905 V!53905 (_ BitVec 32) Int) ListLongMap!21321)

(assert (=> b!1330691 (= lt!591244 (getCurrentListMapNoExtraKeys!6311 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330692 () Bool)

(declare-fun res!882990 () Bool)

(assert (=> b!1330692 (=> (not res!882990) (not e!758386))))

(assert (=> b!1330692 (= res!882990 (and (= (size!44060 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44059 _keys!1590) (size!44060 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56575 () Bool)

(declare-fun mapRes!56575 () Bool)

(assert (=> mapIsEmpty!56575 mapRes!56575))

(declare-fun b!1330693 () Bool)

(declare-fun res!882992 () Bool)

(assert (=> b!1330693 (=> (not res!882992) (not e!758386))))

(declare-datatypes ((List!30815 0))(
  ( (Nil!30812) (Cons!30811 (h!32020 (_ BitVec 64)) (t!44919 List!30815)) )
))
(declare-fun arrayNoDuplicates!0 (array!90086 (_ BitVec 32) List!30815) Bool)

(assert (=> b!1330693 (= res!882992 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30812))))

(declare-fun b!1330694 () Bool)

(declare-fun res!882987 () Bool)

(assert (=> b!1330694 (=> (not res!882987) (not e!758386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90086 (_ BitVec 32)) Bool)

(assert (=> b!1330694 (= res!882987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!882993 () Bool)

(assert (=> start!112296 (=> (not res!882993) (not e!758386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112296 (= res!882993 (validMask!0 mask!1998))))

(assert (=> start!112296 e!758386))

(declare-fun e!758383 () Bool)

(declare-fun array_inv!32821 (array!90088) Bool)

(assert (=> start!112296 (and (array_inv!32821 _values!1320) e!758383)))

(assert (=> start!112296 true))

(declare-fun array_inv!32822 (array!90086) Bool)

(assert (=> start!112296 (array_inv!32822 _keys!1590)))

(assert (=> start!112296 tp!107710))

(declare-fun tp_is_empty!36601 () Bool)

(assert (=> start!112296 tp_is_empty!36601))

(declare-fun b!1330695 () Bool)

(declare-fun res!882986 () Bool)

(assert (=> b!1330695 (=> (not res!882986) (not e!758386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330695 (= res!882986 (validKeyInArray!0 (select (arr!43509 _keys!1590) from!1980)))))

(declare-fun b!1330696 () Bool)

(declare-fun e!758385 () Bool)

(assert (=> b!1330696 (= e!758383 (and e!758385 mapRes!56575))))

(declare-fun condMapEmpty!56575 () Bool)

(declare-fun mapDefault!56575 () ValueCell!17402)

