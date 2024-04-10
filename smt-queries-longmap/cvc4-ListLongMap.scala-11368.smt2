; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132116 () Bool)

(assert start!132116)

(declare-fun b_free!31829 () Bool)

(declare-fun b_next!31829 () Bool)

(assert (=> start!132116 (= b_free!31829 (not b_next!31829))))

(declare-fun tp!111739 () Bool)

(declare-fun b_and!51239 () Bool)

(assert (=> start!132116 (= tp!111739 b_and!51239)))

(declare-fun b!1549337 () Bool)

(declare-fun res!1061512 () Bool)

(declare-fun e!862420 () Bool)

(assert (=> b!1549337 (=> (not res!1061512) (not e!862420))))

(declare-datatypes ((array!103406 0))(
  ( (array!103407 (arr!49905 (Array (_ BitVec 32) (_ BitVec 64))) (size!50455 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103406)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549337 (= res!1061512 (validKeyInArray!0 (select (arr!49905 _keys!618) from!762)))))

(declare-fun b!1549338 () Bool)

(declare-fun res!1061511 () Bool)

(declare-fun e!862419 () Bool)

(assert (=> b!1549338 (=> (not res!1061511) (not e!862419))))

(declare-datatypes ((List!36124 0))(
  ( (Nil!36121) (Cons!36120 (h!37565 (_ BitVec 64)) (t!50818 List!36124)) )
))
(declare-fun arrayNoDuplicates!0 (array!103406 (_ BitVec 32) List!36124) Bool)

(assert (=> b!1549338 (= res!1061511 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36121))))

(declare-fun b!1549339 () Bool)

(declare-datatypes ((V!59249 0))(
  ( (V!59250 (val!19130 Int)) )
))
(declare-datatypes ((tuple2!24638 0))(
  ( (tuple2!24639 (_1!12330 (_ BitVec 64)) (_2!12330 V!59249)) )
))
(declare-datatypes ((List!36125 0))(
  ( (Nil!36122) (Cons!36121 (h!37566 tuple2!24638) (t!50819 List!36125)) )
))
(declare-datatypes ((ListLongMap!22247 0))(
  ( (ListLongMap!22248 (toList!11139 List!36125)) )
))
(declare-fun e!862415 () ListLongMap!22247)

(declare-fun call!70445 () ListLongMap!22247)

(assert (=> b!1549339 (= e!862415 call!70445)))

(declare-fun bm!70442 () Bool)

(declare-fun call!70447 () ListLongMap!22247)

(declare-fun call!70446 () ListLongMap!22247)

(assert (=> bm!70442 (= call!70447 call!70446)))

(declare-fun b!1549340 () Bool)

(declare-fun c!142360 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667804 () Bool)

(assert (=> b!1549340 (= c!142360 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667804))))

(declare-fun e!862421 () ListLongMap!22247)

(assert (=> b!1549340 (= e!862421 e!862415)))

(declare-fun mapIsEmpty!58861 () Bool)

(declare-fun mapRes!58861 () Bool)

(assert (=> mapIsEmpty!58861 mapRes!58861))

(declare-fun zeroValue!436 () V!59249)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18142 0))(
  ( (ValueCellFull!18142 (v!21931 V!59249)) (EmptyCell!18142) )
))
(declare-datatypes ((array!103408 0))(
  ( (array!103409 (arr!49906 (Array (_ BitVec 32) ValueCell!18142)) (size!50456 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103408)

(declare-fun minValue!436 () V!59249)

(declare-fun bm!70443 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6591 (array!103406 array!103408 (_ BitVec 32) (_ BitVec 32) V!59249 V!59249 (_ BitVec 32) Int) ListLongMap!22247)

(assert (=> bm!70443 (= call!70446 (getCurrentListMapNoExtraKeys!6591 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549341 () Bool)

(declare-fun e!862416 () Bool)

(declare-fun tp_is_empty!38105 () Bool)

(assert (=> b!1549341 (= e!862416 tp_is_empty!38105)))

(declare-fun b!1549342 () Bool)

(declare-fun e!862418 () ListLongMap!22247)

(declare-fun call!70448 () ListLongMap!22247)

(declare-fun +!4966 (ListLongMap!22247 tuple2!24638) ListLongMap!22247)

(assert (=> b!1549342 (= e!862418 (+!4966 call!70448 (tuple2!24639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549343 () Bool)

(declare-fun e!862414 () Bool)

(assert (=> b!1549343 (= e!862414 tp_is_empty!38105)))

(declare-fun b!1549344 () Bool)

(declare-fun call!70449 () ListLongMap!22247)

(assert (=> b!1549344 (= e!862421 call!70449)))

(declare-fun b!1549345 () Bool)

(assert (=> b!1549345 (= e!862419 e!862420)))

(declare-fun res!1061513 () Bool)

(assert (=> b!1549345 (=> (not res!1061513) (not e!862420))))

(assert (=> b!1549345 (= res!1061513 (bvslt from!762 (size!50455 _keys!618)))))

(declare-fun lt!667800 () ListLongMap!22247)

(assert (=> b!1549345 (= lt!667800 e!862418)))

(declare-fun c!142361 () Bool)

(assert (=> b!1549345 (= c!142361 (and (not lt!667804) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549345 (= lt!667804 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!1061516 () Bool)

(assert (=> start!132116 (=> (not res!1061516) (not e!862419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132116 (= res!1061516 (validMask!0 mask!926))))

(assert (=> start!132116 e!862419))

(declare-fun array_inv!38797 (array!103406) Bool)

(assert (=> start!132116 (array_inv!38797 _keys!618)))

(assert (=> start!132116 tp_is_empty!38105))

(assert (=> start!132116 true))

(assert (=> start!132116 tp!111739))

(declare-fun e!862417 () Bool)

(declare-fun array_inv!38798 (array!103408) Bool)

(assert (=> start!132116 (and (array_inv!38798 _values!470) e!862417)))

(declare-fun mapNonEmpty!58861 () Bool)

(declare-fun tp!111738 () Bool)

(assert (=> mapNonEmpty!58861 (= mapRes!58861 (and tp!111738 e!862416))))

(declare-fun mapValue!58861 () ValueCell!18142)

(declare-fun mapKey!58861 () (_ BitVec 32))

(declare-fun mapRest!58861 () (Array (_ BitVec 32) ValueCell!18142))

(assert (=> mapNonEmpty!58861 (= (arr!49906 _values!470) (store mapRest!58861 mapKey!58861 mapValue!58861))))

(declare-fun b!1549346 () Bool)

(declare-fun res!1061517 () Bool)

(assert (=> b!1549346 (=> (not res!1061517) (not e!862419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103406 (_ BitVec 32)) Bool)

(assert (=> b!1549346 (= res!1061517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549347 () Bool)

(assert (=> b!1549347 (= e!862415 call!70449)))

(declare-fun bm!70444 () Bool)

(declare-fun c!142359 () Bool)

(assert (=> bm!70444 (= call!70448 (+!4966 (ite c!142361 call!70446 (ite c!142359 call!70447 call!70445)) (ite (or c!142361 c!142359) (tuple2!24639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549348 () Bool)

(declare-fun res!1061515 () Bool)

(assert (=> b!1549348 (=> (not res!1061515) (not e!862419))))

(assert (=> b!1549348 (= res!1061515 (and (= (size!50456 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50455 _keys!618) (size!50456 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549349 () Bool)

(declare-fun res!1061514 () Bool)

(assert (=> b!1549349 (=> (not res!1061514) (not e!862419))))

(assert (=> b!1549349 (= res!1061514 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50455 _keys!618))))))

(declare-fun b!1549350 () Bool)

(assert (=> b!1549350 (= e!862417 (and e!862414 mapRes!58861))))

(declare-fun condMapEmpty!58861 () Bool)

(declare-fun mapDefault!58861 () ValueCell!18142)

