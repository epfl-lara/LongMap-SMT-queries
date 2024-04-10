; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84026 () Bool)

(assert start!84026)

(declare-fun b_free!19781 () Bool)

(declare-fun b_next!19781 () Bool)

(assert (=> start!84026 (= b_free!19781 (not b_next!19781))))

(declare-fun tp!68865 () Bool)

(declare-fun b_and!31645 () Bool)

(assert (=> start!84026 (= tp!68865 b_and!31645)))

(declare-fun b!982209 () Bool)

(declare-fun e!553678 () Bool)

(assert (=> b!982209 (= e!553678 (not true))))

(declare-datatypes ((V!35421 0))(
  ( (V!35422 (val!11465 Int)) )
))
(declare-datatypes ((tuple2!14682 0))(
  ( (tuple2!14683 (_1!7352 (_ BitVec 64)) (_2!7352 V!35421)) )
))
(declare-datatypes ((List!20563 0))(
  ( (Nil!20560) (Cons!20559 (h!21721 tuple2!14682) (t!29294 List!20563)) )
))
(declare-datatypes ((ListLongMap!13379 0))(
  ( (ListLongMap!13380 (toList!6705 List!20563)) )
))
(declare-fun lt!436038 () ListLongMap!13379)

(declare-fun lt!436037 () tuple2!14682)

(declare-fun lt!436036 () tuple2!14682)

(declare-fun +!3003 (ListLongMap!13379 tuple2!14682) ListLongMap!13379)

(assert (=> b!982209 (= (+!3003 (+!3003 lt!436038 lt!436037) lt!436036) (+!3003 (+!3003 lt!436038 lt!436036) lt!436037))))

(declare-fun lt!436039 () V!35421)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61651 0))(
  ( (array!61652 (arr!29683 (Array (_ BitVec 32) (_ BitVec 64))) (size!30162 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61651)

(assert (=> b!982209 (= lt!436036 (tuple2!14683 (select (arr!29683 _keys!1544) from!1932) lt!436039))))

(declare-fun zeroValue!1220 () V!35421)

(assert (=> b!982209 (= lt!436037 (tuple2!14683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32645 0))(
  ( (Unit!32646) )
))
(declare-fun lt!436040 () Unit!32645)

(declare-fun addCommutativeForDiffKeys!631 (ListLongMap!13379 (_ BitVec 64) V!35421 (_ BitVec 64) V!35421) Unit!32645)

(assert (=> b!982209 (= lt!436040 (addCommutativeForDiffKeys!631 lt!436038 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29683 _keys!1544) from!1932) lt!436039))))

(declare-fun b!982210 () Bool)

(declare-fun res!657289 () Bool)

(declare-fun e!553677 () Bool)

(assert (=> b!982210 (=> (not res!657289) (not e!553677))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982210 (= res!657289 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982211 () Bool)

(declare-fun res!657288 () Bool)

(assert (=> b!982211 (=> (not res!657288) (not e!553677))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61651 (_ BitVec 32)) Bool)

(assert (=> b!982211 (= res!657288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!657284 () Bool)

(assert (=> start!84026 (=> (not res!657284) (not e!553677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84026 (= res!657284 (validMask!0 mask!1948))))

(assert (=> start!84026 e!553677))

(assert (=> start!84026 true))

(declare-fun tp_is_empty!22829 () Bool)

(assert (=> start!84026 tp_is_empty!22829))

(declare-datatypes ((ValueCell!10933 0))(
  ( (ValueCellFull!10933 (v!14027 V!35421)) (EmptyCell!10933) )
))
(declare-datatypes ((array!61653 0))(
  ( (array!61654 (arr!29684 (Array (_ BitVec 32) ValueCell!10933)) (size!30163 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61653)

(declare-fun e!553676 () Bool)

(declare-fun array_inv!22953 (array!61653) Bool)

(assert (=> start!84026 (and (array_inv!22953 _values!1278) e!553676)))

(assert (=> start!84026 tp!68865))

(declare-fun array_inv!22954 (array!61651) Bool)

(assert (=> start!84026 (array_inv!22954 _keys!1544)))

(declare-fun b!982212 () Bool)

(declare-fun e!553675 () Bool)

(assert (=> b!982212 (= e!553675 tp_is_empty!22829)))

(declare-fun b!982213 () Bool)

(declare-fun res!657286 () Bool)

(assert (=> b!982213 (=> (not res!657286) (not e!553677))))

(assert (=> b!982213 (= res!657286 (and (= (size!30163 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30162 _keys!1544) (size!30163 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982214 () Bool)

(declare-fun res!657287 () Bool)

(assert (=> b!982214 (=> (not res!657287) (not e!553677))))

(assert (=> b!982214 (= res!657287 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30162 _keys!1544))))))

(declare-fun mapIsEmpty!36272 () Bool)

(declare-fun mapRes!36272 () Bool)

(assert (=> mapIsEmpty!36272 mapRes!36272))

(declare-fun b!982215 () Bool)

(declare-fun res!657285 () Bool)

(assert (=> b!982215 (=> (not res!657285) (not e!553677))))

(declare-datatypes ((List!20564 0))(
  ( (Nil!20561) (Cons!20560 (h!21722 (_ BitVec 64)) (t!29295 List!20564)) )
))
(declare-fun arrayNoDuplicates!0 (array!61651 (_ BitVec 32) List!20564) Bool)

(assert (=> b!982215 (= res!657285 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20561))))

(declare-fun b!982216 () Bool)

(declare-fun res!657290 () Bool)

(assert (=> b!982216 (=> (not res!657290) (not e!553677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982216 (= res!657290 (validKeyInArray!0 (select (arr!29683 _keys!1544) from!1932)))))

(declare-fun b!982217 () Bool)

(assert (=> b!982217 (= e!553677 e!553678)))

(declare-fun res!657283 () Bool)

(assert (=> b!982217 (=> (not res!657283) (not e!553678))))

(assert (=> b!982217 (= res!657283 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29683 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15391 (ValueCell!10933 V!35421) V!35421)

(declare-fun dynLambda!1788 (Int (_ BitVec 64)) V!35421)

(assert (=> b!982217 (= lt!436039 (get!15391 (select (arr!29684 _values!1278) from!1932) (dynLambda!1788 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35421)

(declare-fun getCurrentListMapNoExtraKeys!3405 (array!61651 array!61653 (_ BitVec 32) (_ BitVec 32) V!35421 V!35421 (_ BitVec 32) Int) ListLongMap!13379)

(assert (=> b!982217 (= lt!436038 (getCurrentListMapNoExtraKeys!3405 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982218 () Bool)

(declare-fun e!553679 () Bool)

(assert (=> b!982218 (= e!553679 tp_is_empty!22829)))

(declare-fun mapNonEmpty!36272 () Bool)

(declare-fun tp!68866 () Bool)

(assert (=> mapNonEmpty!36272 (= mapRes!36272 (and tp!68866 e!553679))))

(declare-fun mapKey!36272 () (_ BitVec 32))

(declare-fun mapRest!36272 () (Array (_ BitVec 32) ValueCell!10933))

(declare-fun mapValue!36272 () ValueCell!10933)

(assert (=> mapNonEmpty!36272 (= (arr!29684 _values!1278) (store mapRest!36272 mapKey!36272 mapValue!36272))))

(declare-fun b!982219 () Bool)

(assert (=> b!982219 (= e!553676 (and e!553675 mapRes!36272))))

(declare-fun condMapEmpty!36272 () Bool)

(declare-fun mapDefault!36272 () ValueCell!10933)

