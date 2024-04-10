; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131968 () Bool)

(assert start!131968)

(declare-fun b_free!31681 () Bool)

(declare-fun b_next!31681 () Bool)

(assert (=> start!131968 (= b_free!31681 (not b_next!31681))))

(declare-fun tp!111294 () Bool)

(declare-fun b_and!51091 () Bool)

(assert (=> start!131968 (= tp!111294 b_and!51091)))

(declare-fun bm!69332 () Bool)

(declare-datatypes ((V!59053 0))(
  ( (V!59054 (val!19056 Int)) )
))
(declare-datatypes ((tuple2!24494 0))(
  ( (tuple2!24495 (_1!12258 (_ BitVec 64)) (_2!12258 V!59053)) )
))
(declare-datatypes ((List!36003 0))(
  ( (Nil!36000) (Cons!35999 (h!37444 tuple2!24494) (t!50697 List!36003)) )
))
(declare-datatypes ((ListLongMap!22103 0))(
  ( (ListLongMap!22104 (toList!11067 List!36003)) )
))
(declare-fun call!69339 () ListLongMap!22103)

(declare-fun call!69338 () ListLongMap!22103)

(assert (=> bm!69332 (= call!69339 call!69338)))

(declare-fun b!1545785 () Bool)

(declare-fun res!1059960 () Bool)

(declare-fun e!860417 () Bool)

(assert (=> b!1545785 (=> (not res!1059960) (not e!860417))))

(declare-datatypes ((array!103120 0))(
  ( (array!103121 (arr!49762 (Array (_ BitVec 32) (_ BitVec 64))) (size!50312 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103120)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103120 (_ BitVec 32)) Bool)

(assert (=> b!1545785 (= res!1059960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059963 () Bool)

(assert (=> start!131968 (=> (not res!1059963) (not e!860417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131968 (= res!1059963 (validMask!0 mask!926))))

(assert (=> start!131968 e!860417))

(declare-fun array_inv!38705 (array!103120) Bool)

(assert (=> start!131968 (array_inv!38705 _keys!618)))

(declare-fun tp_is_empty!37957 () Bool)

(assert (=> start!131968 tp_is_empty!37957))

(assert (=> start!131968 true))

(assert (=> start!131968 tp!111294))

(declare-datatypes ((ValueCell!18068 0))(
  ( (ValueCellFull!18068 (v!21857 V!59053)) (EmptyCell!18068) )
))
(declare-datatypes ((array!103122 0))(
  ( (array!103123 (arr!49763 (Array (_ BitVec 32) ValueCell!18068)) (size!50313 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103122)

(declare-fun e!860422 () Bool)

(declare-fun array_inv!38706 (array!103122) Bool)

(assert (=> start!131968 (and (array_inv!38706 _values!470) e!860422)))

(declare-fun b!1545786 () Bool)

(declare-fun c!141694 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666401 () Bool)

(assert (=> b!1545786 (= c!141694 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666401))))

(declare-fun e!860423 () ListLongMap!22103)

(declare-fun e!860424 () ListLongMap!22103)

(assert (=> b!1545786 (= e!860423 e!860424)))

(declare-fun b!1545787 () Bool)

(declare-fun res!1059957 () Bool)

(assert (=> b!1545787 (=> (not res!1059957) (not e!860417))))

(assert (=> b!1545787 (= res!1059957 (and (= (size!50313 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50312 _keys!618) (size!50313 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69333 () Bool)

(declare-fun call!69335 () ListLongMap!22103)

(declare-fun call!69336 () ListLongMap!22103)

(assert (=> bm!69333 (= call!69335 call!69336)))

(declare-fun b!1545788 () Bool)

(declare-fun call!69337 () ListLongMap!22103)

(assert (=> b!1545788 (= e!860424 call!69337)))

(declare-fun b!1545789 () Bool)

(assert (=> b!1545789 (= e!860423 call!69339)))

(declare-fun b!1545790 () Bool)

(declare-fun res!1059962 () Bool)

(assert (=> b!1545790 (=> (not res!1059962) (not e!860417))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1545790 (= res!1059962 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50312 _keys!618))))))

(declare-fun b!1545791 () Bool)

(declare-fun e!860421 () ListLongMap!22103)

(assert (=> b!1545791 (= e!860421 e!860423)))

(declare-fun c!141693 () Bool)

(assert (=> b!1545791 (= c!141693 (and (not lt!666401) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545792 () Bool)

(declare-fun e!860416 () Bool)

(assert (=> b!1545792 (= e!860416 (not true))))

(declare-fun zeroValue!436 () V!59053)

(declare-fun lt!666402 () ListLongMap!22103)

(declare-fun contains!10036 (ListLongMap!22103 (_ BitVec 64)) Bool)

(declare-fun +!4902 (ListLongMap!22103 tuple2!24494) ListLongMap!22103)

(assert (=> b!1545792 (contains!10036 (+!4902 lt!666402 (tuple2!24495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49762 _keys!618) from!762))))

(declare-datatypes ((Unit!51508 0))(
  ( (Unit!51509) )
))
(declare-fun lt!666403 () Unit!51508)

(declare-fun addStillContains!1224 (ListLongMap!22103 (_ BitVec 64) V!59053 (_ BitVec 64)) Unit!51508)

(assert (=> b!1545792 (= lt!666403 (addStillContains!1224 lt!666402 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49762 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59053)

(declare-fun getCurrentListMapNoExtraKeys!6534 (array!103120 array!103122 (_ BitVec 32) (_ BitVec 32) V!59053 V!59053 (_ BitVec 32) Int) ListLongMap!22103)

(assert (=> b!1545792 (= lt!666402 (getCurrentListMapNoExtraKeys!6534 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545793 () Bool)

(declare-fun e!860418 () Bool)

(assert (=> b!1545793 (= e!860418 tp_is_empty!37957)))

(declare-fun bm!69334 () Bool)

(assert (=> bm!69334 (= call!69337 call!69335)))

(declare-fun b!1545794 () Bool)

(assert (=> b!1545794 (= e!860424 call!69339)))

(declare-fun bm!69335 () Bool)

(assert (=> bm!69335 (= call!69336 (getCurrentListMapNoExtraKeys!6534 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545795 () Bool)

(declare-fun res!1059958 () Bool)

(assert (=> b!1545795 (=> (not res!1059958) (not e!860417))))

(declare-datatypes ((List!36004 0))(
  ( (Nil!36001) (Cons!36000 (h!37445 (_ BitVec 64)) (t!50698 List!36004)) )
))
(declare-fun arrayNoDuplicates!0 (array!103120 (_ BitVec 32) List!36004) Bool)

(assert (=> b!1545795 (= res!1059958 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36001))))

(declare-fun mapNonEmpty!58639 () Bool)

(declare-fun mapRes!58639 () Bool)

(declare-fun tp!111295 () Bool)

(declare-fun e!860420 () Bool)

(assert (=> mapNonEmpty!58639 (= mapRes!58639 (and tp!111295 e!860420))))

(declare-fun mapKey!58639 () (_ BitVec 32))

(declare-fun mapValue!58639 () ValueCell!18068)

(declare-fun mapRest!58639 () (Array (_ BitVec 32) ValueCell!18068))

(assert (=> mapNonEmpty!58639 (= (arr!49763 _values!470) (store mapRest!58639 mapKey!58639 mapValue!58639))))

(declare-fun b!1545796 () Bool)

(assert (=> b!1545796 (= e!860417 e!860416)))

(declare-fun res!1059959 () Bool)

(assert (=> b!1545796 (=> (not res!1059959) (not e!860416))))

(assert (=> b!1545796 (= res!1059959 (bvslt from!762 (size!50312 _keys!618)))))

(declare-fun lt!666404 () ListLongMap!22103)

(assert (=> b!1545796 (= lt!666404 e!860421)))

(declare-fun c!141695 () Bool)

(assert (=> b!1545796 (= c!141695 (and (not lt!666401) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545796 (= lt!666401 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545797 () Bool)

(assert (=> b!1545797 (= e!860420 tp_is_empty!37957)))

(declare-fun mapIsEmpty!58639 () Bool)

(assert (=> mapIsEmpty!58639 mapRes!58639))

(declare-fun b!1545798 () Bool)

(assert (=> b!1545798 (= e!860421 (+!4902 call!69338 (tuple2!24495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545799 () Bool)

(declare-fun res!1059961 () Bool)

(assert (=> b!1545799 (=> (not res!1059961) (not e!860416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545799 (= res!1059961 (validKeyInArray!0 (select (arr!49762 _keys!618) from!762)))))

(declare-fun b!1545800 () Bool)

(assert (=> b!1545800 (= e!860422 (and e!860418 mapRes!58639))))

(declare-fun condMapEmpty!58639 () Bool)

(declare-fun mapDefault!58639 () ValueCell!18068)

