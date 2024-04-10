; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133634 () Bool)

(assert start!133634)

(declare-fun b_free!32051 () Bool)

(declare-fun b_next!32051 () Bool)

(assert (=> start!133634 (= b_free!32051 (not b_next!32051))))

(declare-fun tp!113277 () Bool)

(declare-fun b_and!51613 () Bool)

(assert (=> start!133634 (= tp!113277 b_and!51613)))

(declare-fun b!1562524 () Bool)

(declare-fun res!1068302 () Bool)

(declare-fun e!870717 () Bool)

(assert (=> b!1562524 (=> (not res!1068302) (not e!870717))))

(declare-datatypes ((array!104150 0))(
  ( (array!104151 (arr!50267 (Array (_ BitVec 32) (_ BitVec 64))) (size!50817 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104150)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562524 (= res!1068302 (validKeyInArray!0 (select (arr!50267 _keys!637) from!782)))))

(declare-fun res!1068301 () Bool)

(assert (=> start!133634 (=> (not res!1068301) (not e!870717))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133634 (= res!1068301 (validMask!0 mask!947))))

(assert (=> start!133634 e!870717))

(assert (=> start!133634 tp!113277))

(declare-fun tp_is_empty!38717 () Bool)

(assert (=> start!133634 tp_is_empty!38717))

(assert (=> start!133634 true))

(declare-fun array_inv!39069 (array!104150) Bool)

(assert (=> start!133634 (array_inv!39069 _keys!637)))

(declare-datatypes ((V!59829 0))(
  ( (V!59830 (val!19442 Int)) )
))
(declare-datatypes ((ValueCell!18328 0))(
  ( (ValueCellFull!18328 (v!22194 V!59829)) (EmptyCell!18328) )
))
(declare-datatypes ((array!104152 0))(
  ( (array!104153 (arr!50268 (Array (_ BitVec 32) ValueCell!18328)) (size!50818 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104152)

(declare-fun e!870718 () Bool)

(declare-fun array_inv!39070 (array!104152) Bool)

(assert (=> start!133634 (and (array_inv!39070 _values!487) e!870718)))

(declare-fun b!1562525 () Bool)

(declare-fun res!1068305 () Bool)

(assert (=> b!1562525 (=> (not res!1068305) (not e!870717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104150 (_ BitVec 32)) Bool)

(assert (=> b!1562525 (= res!1068305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562526 () Bool)

(assert (=> b!1562526 (= e!870717 (not true))))

(declare-fun lt!671707 () Bool)

(declare-datatypes ((tuple2!25118 0))(
  ( (tuple2!25119 (_1!12570 (_ BitVec 64)) (_2!12570 V!59829)) )
))
(declare-datatypes ((List!36489 0))(
  ( (Nil!36486) (Cons!36485 (h!37931 tuple2!25118) (t!51330 List!36489)) )
))
(declare-datatypes ((ListLongMap!22553 0))(
  ( (ListLongMap!22554 (toList!11292 List!36489)) )
))
(declare-fun lt!671706 () ListLongMap!22553)

(declare-fun contains!10282 (ListLongMap!22553 (_ BitVec 64)) Bool)

(assert (=> b!1562526 (= lt!671707 (contains!10282 lt!671706 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562526 (not (contains!10282 lt!671706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671708 () V!59829)

(declare-fun lt!671705 () ListLongMap!22553)

(declare-fun +!5062 (ListLongMap!22553 tuple2!25118) ListLongMap!22553)

(assert (=> b!1562526 (= lt!671706 (+!5062 lt!671705 (tuple2!25119 (select (arr!50267 _keys!637) from!782) lt!671708)))))

(declare-datatypes ((Unit!51978 0))(
  ( (Unit!51979) )
))
(declare-fun lt!671709 () Unit!51978)

(declare-fun addStillNotContains!552 (ListLongMap!22553 (_ BitVec 64) V!59829 (_ BitVec 64)) Unit!51978)

(assert (=> b!1562526 (= lt!671709 (addStillNotContains!552 lt!671705 (select (arr!50267 _keys!637) from!782) lt!671708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26255 (ValueCell!18328 V!59829) V!59829)

(declare-fun dynLambda!3846 (Int (_ BitVec 64)) V!59829)

(assert (=> b!1562526 (= lt!671708 (get!26255 (select (arr!50268 _values!487) from!782) (dynLambda!3846 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59829)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59829)

(declare-fun getCurrentListMapNoExtraKeys!6676 (array!104150 array!104152 (_ BitVec 32) (_ BitVec 32) V!59829 V!59829 (_ BitVec 32) Int) ListLongMap!22553)

(assert (=> b!1562526 (= lt!671705 (getCurrentListMapNoExtraKeys!6676 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562527 () Bool)

(declare-fun res!1068303 () Bool)

(assert (=> b!1562527 (=> (not res!1068303) (not e!870717))))

(assert (=> b!1562527 (= res!1068303 (and (= (size!50818 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50817 _keys!637) (size!50818 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562528 () Bool)

(declare-fun e!870716 () Bool)

(assert (=> b!1562528 (= e!870716 tp_is_empty!38717)))

(declare-fun b!1562529 () Bool)

(declare-fun res!1068304 () Bool)

(assert (=> b!1562529 (=> (not res!1068304) (not e!870717))))

(assert (=> b!1562529 (= res!1068304 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50817 _keys!637)) (bvslt from!782 (size!50817 _keys!637))))))

(declare-fun mapNonEmpty!59451 () Bool)

(declare-fun mapRes!59451 () Bool)

(declare-fun tp!113276 () Bool)

(declare-fun e!870714 () Bool)

(assert (=> mapNonEmpty!59451 (= mapRes!59451 (and tp!113276 e!870714))))

(declare-fun mapRest!59451 () (Array (_ BitVec 32) ValueCell!18328))

(declare-fun mapKey!59451 () (_ BitVec 32))

(declare-fun mapValue!59451 () ValueCell!18328)

(assert (=> mapNonEmpty!59451 (= (arr!50268 _values!487) (store mapRest!59451 mapKey!59451 mapValue!59451))))

(declare-fun b!1562530 () Bool)

(assert (=> b!1562530 (= e!870718 (and e!870716 mapRes!59451))))

(declare-fun condMapEmpty!59451 () Bool)

(declare-fun mapDefault!59451 () ValueCell!18328)

