; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84242 () Bool)

(assert start!84242)

(declare-fun b_free!19943 () Bool)

(declare-fun b_next!19943 () Bool)

(assert (=> start!84242 (= b_free!19943 (not b_next!19943))))

(declare-fun tp!69432 () Bool)

(declare-fun b_and!31963 () Bool)

(assert (=> start!84242 (= tp!69432 b_and!31963)))

(declare-fun b!985542 () Bool)

(declare-fun res!659492 () Bool)

(declare-fun e!555532 () Bool)

(assert (=> b!985542 (=> (not res!659492) (not e!555532))))

(declare-datatypes ((array!62065 0))(
  ( (array!62066 (arr!29890 (Array (_ BitVec 32) (_ BitVec 64))) (size!30369 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62065)

(declare-datatypes ((List!20703 0))(
  ( (Nil!20700) (Cons!20699 (h!21861 (_ BitVec 64)) (t!29590 List!20703)) )
))
(declare-fun arrayNoDuplicates!0 (array!62065 (_ BitVec 32) List!20703) Bool)

(assert (=> b!985542 (= res!659492 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20700))))

(declare-fun b!985543 () Bool)

(declare-fun e!555529 () Bool)

(declare-fun tp_is_empty!23045 () Bool)

(assert (=> b!985543 (= e!555529 tp_is_empty!23045)))

(declare-fun b!985544 () Bool)

(declare-fun e!555531 () Bool)

(assert (=> b!985544 (= e!555532 e!555531)))

(declare-fun res!659491 () Bool)

(assert (=> b!985544 (=> (not res!659491) (not e!555531))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985544 (= res!659491 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29890 _keys!1544) from!1932))))))

(declare-datatypes ((V!35709 0))(
  ( (V!35710 (val!11573 Int)) )
))
(declare-datatypes ((ValueCell!11041 0))(
  ( (ValueCellFull!11041 (v!14135 V!35709)) (EmptyCell!11041) )
))
(declare-datatypes ((array!62067 0))(
  ( (array!62068 (arr!29891 (Array (_ BitVec 32) ValueCell!11041)) (size!30370 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62067)

(declare-fun lt!437288 () V!35709)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15516 (ValueCell!11041 V!35709) V!35709)

(declare-fun dynLambda!1841 (Int (_ BitVec 64)) V!35709)

(assert (=> b!985544 (= lt!437288 (get!15516 (select (arr!29891 _values!1278) from!1932) (dynLambda!1841 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35709)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35709)

(declare-datatypes ((tuple2!14812 0))(
  ( (tuple2!14813 (_1!7417 (_ BitVec 64)) (_2!7417 V!35709)) )
))
(declare-datatypes ((List!20704 0))(
  ( (Nil!20701) (Cons!20700 (h!21862 tuple2!14812) (t!29591 List!20704)) )
))
(declare-datatypes ((ListLongMap!13509 0))(
  ( (ListLongMap!13510 (toList!6770 List!20704)) )
))
(declare-fun lt!437290 () ListLongMap!13509)

(declare-fun getCurrentListMapNoExtraKeys!3461 (array!62065 array!62067 (_ BitVec 32) (_ BitVec 32) V!35709 V!35709 (_ BitVec 32) Int) ListLongMap!13509)

(assert (=> b!985544 (= lt!437290 (getCurrentListMapNoExtraKeys!3461 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36596 () Bool)

(declare-fun mapRes!36596 () Bool)

(declare-fun tp!69433 () Bool)

(declare-fun e!555533 () Bool)

(assert (=> mapNonEmpty!36596 (= mapRes!36596 (and tp!69433 e!555533))))

(declare-fun mapValue!36596 () ValueCell!11041)

(declare-fun mapRest!36596 () (Array (_ BitVec 32) ValueCell!11041))

(declare-fun mapKey!36596 () (_ BitVec 32))

(assert (=> mapNonEmpty!36596 (= (arr!29891 _values!1278) (store mapRest!36596 mapKey!36596 mapValue!36596))))

(declare-fun b!985546 () Bool)

(declare-fun res!659490 () Bool)

(assert (=> b!985546 (=> (not res!659490) (not e!555532))))

(assert (=> b!985546 (= res!659490 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30369 _keys!1544))))))

(declare-fun b!985547 () Bool)

(declare-fun e!555530 () Bool)

(assert (=> b!985547 (= e!555530 (and e!555529 mapRes!36596))))

(declare-fun condMapEmpty!36596 () Bool)

(declare-fun mapDefault!36596 () ValueCell!11041)

