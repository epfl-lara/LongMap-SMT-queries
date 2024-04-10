; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132152 () Bool)

(assert start!132152)

(declare-fun b_free!31865 () Bool)

(declare-fun b_next!31865 () Bool)

(assert (=> start!132152 (= b_free!31865 (not b_next!31865))))

(declare-fun tp!111847 () Bool)

(declare-fun b_and!51287 () Bool)

(assert (=> start!132152 (= tp!111847 b_and!51287)))

(declare-fun bm!70721 () Bool)

(declare-datatypes ((V!59297 0))(
  ( (V!59298 (val!19148 Int)) )
))
(declare-datatypes ((tuple2!24674 0))(
  ( (tuple2!24675 (_1!12348 (_ BitVec 64)) (_2!12348 V!59297)) )
))
(declare-datatypes ((List!36156 0))(
  ( (Nil!36153) (Cons!36152 (h!37597 tuple2!24674) (t!50862 List!36156)) )
))
(declare-datatypes ((ListLongMap!22283 0))(
  ( (ListLongMap!22284 (toList!11157 List!36156)) )
))
(declare-fun call!70727 () ListLongMap!22283)

(declare-fun call!70724 () ListLongMap!22283)

(assert (=> bm!70721 (= call!70727 call!70724)))

(declare-fun b!1550339 () Bool)

(declare-fun res!1061943 () Bool)

(declare-fun e!862999 () Bool)

(assert (=> b!1550339 (=> (not res!1061943) (not e!862999))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103478 0))(
  ( (array!103479 (arr!49941 (Array (_ BitVec 32) (_ BitVec 64))) (size!50491 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103478)

(assert (=> b!1550339 (= res!1061943 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50491 _keys!618))))))

(declare-fun b!1550340 () Bool)

(declare-fun res!1061946 () Bool)

(assert (=> b!1550340 (=> (not res!1061946) (not e!862999))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18160 0))(
  ( (ValueCellFull!18160 (v!21949 V!59297)) (EmptyCell!18160) )
))
(declare-datatypes ((array!103480 0))(
  ( (array!103481 (arr!49942 (Array (_ BitVec 32) ValueCell!18160)) (size!50492 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103480)

(assert (=> b!1550340 (= res!1061946 (and (= (size!50492 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50491 _keys!618) (size!50492 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550341 () Bool)

(declare-fun e!863003 () Bool)

(declare-fun tp_is_empty!38141 () Bool)

(assert (=> b!1550341 (= e!863003 tp_is_empty!38141)))

(declare-fun b!1550342 () Bool)

(declare-fun res!1061949 () Bool)

(declare-fun e!863005 () Bool)

(assert (=> b!1550342 (=> (not res!1061949) (not e!863005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550342 (= res!1061949 (validKeyInArray!0 (select (arr!49941 _keys!618) from!762)))))

(declare-fun b!1550343 () Bool)

(declare-fun res!1061948 () Bool)

(assert (=> b!1550343 (=> (not res!1061948) (not e!862999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103478 (_ BitVec 32)) Bool)

(assert (=> b!1550343 (= res!1061948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550344 () Bool)

(declare-fun e!863004 () ListLongMap!22283)

(declare-fun call!70728 () ListLongMap!22283)

(assert (=> b!1550344 (= e!863004 call!70728)))

(declare-fun b!1550345 () Bool)

(declare-fun e!863006 () Bool)

(assert (=> b!1550345 (= e!863006 tp_is_empty!38141)))

(declare-fun mapIsEmpty!58915 () Bool)

(declare-fun mapRes!58915 () Bool)

(assert (=> mapIsEmpty!58915 mapRes!58915))

(declare-fun b!1550346 () Bool)

(declare-fun e!863001 () ListLongMap!22283)

(assert (=> b!1550346 (= e!863001 call!70728)))

(declare-fun b!1550347 () Bool)

(declare-fun call!70726 () ListLongMap!22283)

(assert (=> b!1550347 (= e!863004 call!70726)))

(declare-fun b!1550348 () Bool)

(assert (=> b!1550348 (= e!863005 false)))

(declare-fun zeroValue!436 () V!59297)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59297)

(declare-fun lt!668264 () ListLongMap!22283)

(declare-fun getCurrentListMapNoExtraKeys!6607 (array!103478 array!103480 (_ BitVec 32) (_ BitVec 32) V!59297 V!59297 (_ BitVec 32) Int) ListLongMap!22283)

(assert (=> b!1550348 (= lt!668264 (getCurrentListMapNoExtraKeys!6607 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550349 () Bool)

(assert (=> b!1550349 (= e!862999 e!863005)))

(declare-fun res!1061945 () Bool)

(assert (=> b!1550349 (=> (not res!1061945) (not e!863005))))

(assert (=> b!1550349 (= res!1061945 (bvslt from!762 (size!50491 _keys!618)))))

(declare-fun lt!668262 () ListLongMap!22283)

(declare-fun e!863007 () ListLongMap!22283)

(assert (=> b!1550349 (= lt!668262 e!863007)))

(declare-fun c!142559 () Bool)

(declare-fun lt!668263 () Bool)

(assert (=> b!1550349 (= c!142559 (and (not lt!668263) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550349 (= lt!668263 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70722 () Bool)

(assert (=> bm!70722 (= call!70726 call!70727)))

(declare-fun b!1550350 () Bool)

(declare-fun c!142558 () Bool)

(assert (=> b!1550350 (= c!142558 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668263))))

(assert (=> b!1550350 (= e!863001 e!863004)))

(declare-fun res!1061944 () Bool)

(assert (=> start!132152 (=> (not res!1061944) (not e!862999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132152 (= res!1061944 (validMask!0 mask!926))))

(assert (=> start!132152 e!862999))

(declare-fun array_inv!38829 (array!103478) Bool)

(assert (=> start!132152 (array_inv!38829 _keys!618)))

(assert (=> start!132152 tp_is_empty!38141))

(assert (=> start!132152 true))

(assert (=> start!132152 tp!111847))

(declare-fun e!863000 () Bool)

(declare-fun array_inv!38830 (array!103480) Bool)

(assert (=> start!132152 (and (array_inv!38830 _values!470) e!863000)))

(declare-fun mapNonEmpty!58915 () Bool)

(declare-fun tp!111846 () Bool)

(assert (=> mapNonEmpty!58915 (= mapRes!58915 (and tp!111846 e!863003))))

(declare-fun mapValue!58915 () ValueCell!18160)

(declare-fun mapKey!58915 () (_ BitVec 32))

(declare-fun mapRest!58915 () (Array (_ BitVec 32) ValueCell!18160))

(assert (=> mapNonEmpty!58915 (= (arr!49942 _values!470) (store mapRest!58915 mapKey!58915 mapValue!58915))))

(declare-fun bm!70723 () Bool)

(assert (=> bm!70723 (= call!70724 (getCurrentListMapNoExtraKeys!6607 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550351 () Bool)

(assert (=> b!1550351 (= e!863000 (and e!863006 mapRes!58915))))

(declare-fun condMapEmpty!58915 () Bool)

(declare-fun mapDefault!58915 () ValueCell!18160)

