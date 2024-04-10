; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131928 () Bool)

(assert start!131928)

(declare-fun b_free!31641 () Bool)

(declare-fun b_next!31641 () Bool)

(assert (=> start!131928 (= b_free!31641 (not b_next!31641))))

(declare-fun tp!111174 () Bool)

(declare-fun b_and!51051 () Bool)

(assert (=> start!131928 (= tp!111174 b_and!51051)))

(declare-fun b!1544851 () Bool)

(declare-fun res!1059567 () Bool)

(declare-fun e!859894 () Bool)

(assert (=> b!1544851 (=> (not res!1059567) (not e!859894))))

(declare-datatypes ((array!103042 0))(
  ( (array!103043 (arr!49723 (Array (_ BitVec 32) (_ BitVec 64))) (size!50273 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103042)

(declare-datatypes ((List!35971 0))(
  ( (Nil!35968) (Cons!35967 (h!37412 (_ BitVec 64)) (t!50665 List!35971)) )
))
(declare-fun arrayNoDuplicates!0 (array!103042 (_ BitVec 32) List!35971) Bool)

(assert (=> b!1544851 (= res!1059567 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35968))))

(declare-fun b!1544852 () Bool)

(declare-datatypes ((V!58999 0))(
  ( (V!59000 (val!19036 Int)) )
))
(declare-datatypes ((tuple2!24458 0))(
  ( (tuple2!24459 (_1!12240 (_ BitVec 64)) (_2!12240 V!58999)) )
))
(declare-datatypes ((List!35972 0))(
  ( (Nil!35969) (Cons!35968 (h!37413 tuple2!24458) (t!50666 List!35972)) )
))
(declare-datatypes ((ListLongMap!22067 0))(
  ( (ListLongMap!22068 (toList!11049 List!35972)) )
))
(declare-fun e!859889 () ListLongMap!22067)

(declare-fun e!859890 () ListLongMap!22067)

(assert (=> b!1544852 (= e!859889 e!859890)))

(declare-fun c!141514 () Bool)

(declare-fun lt!666197 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544852 (= c!141514 (and (not lt!666197) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69032 () Bool)

(declare-fun call!69035 () ListLongMap!22067)

(declare-fun zeroValue!436 () V!58999)

(declare-fun call!69037 () ListLongMap!22067)

(declare-fun call!69038 () ListLongMap!22067)

(declare-fun minValue!436 () V!58999)

(declare-fun c!141515 () Bool)

(declare-fun call!69039 () ListLongMap!22067)

(declare-fun +!4885 (ListLongMap!22067 tuple2!24458) ListLongMap!22067)

(assert (=> bm!69032 (= call!69037 (+!4885 (ite c!141515 call!69038 (ite c!141514 call!69039 call!69035)) (ite (or c!141515 c!141514) (tuple2!24459 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24459 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69033 () Bool)

(assert (=> bm!69033 (= call!69039 call!69038)))

(declare-fun b!1544854 () Bool)

(declare-fun res!1059566 () Bool)

(assert (=> b!1544854 (=> (not res!1059566) (not e!859894))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103042 (_ BitVec 32)) Bool)

(assert (=> b!1544854 (= res!1059566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544855 () Bool)

(declare-fun res!1059565 () Bool)

(assert (=> b!1544855 (=> (not res!1059565) (not e!859894))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544855 (= res!1059565 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50273 _keys!618))))))

(declare-fun bm!69034 () Bool)

(declare-fun call!69036 () ListLongMap!22067)

(assert (=> bm!69034 (= call!69036 call!69037)))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69035 () Bool)

(declare-datatypes ((ValueCell!18048 0))(
  ( (ValueCellFull!18048 (v!21837 V!58999)) (EmptyCell!18048) )
))
(declare-datatypes ((array!103044 0))(
  ( (array!103045 (arr!49724 (Array (_ BitVec 32) ValueCell!18048)) (size!50274 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103044)

(declare-fun getCurrentListMapNoExtraKeys!6519 (array!103042 array!103044 (_ BitVec 32) (_ BitVec 32) V!58999 V!58999 (_ BitVec 32) Int) ListLongMap!22067)

(assert (=> bm!69035 (= call!69038 (getCurrentListMapNoExtraKeys!6519 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544856 () Bool)

(declare-fun res!1059563 () Bool)

(assert (=> b!1544856 (=> (not res!1059563) (not e!859894))))

(assert (=> b!1544856 (= res!1059563 (and (= (size!50274 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50273 _keys!618) (size!50274 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58579 () Bool)

(declare-fun mapRes!58579 () Bool)

(assert (=> mapIsEmpty!58579 mapRes!58579))

(declare-fun b!1544857 () Bool)

(assert (=> b!1544857 (= e!859894 false)))

(declare-fun lt!666196 () ListLongMap!22067)

(assert (=> b!1544857 (= lt!666196 e!859889)))

(assert (=> b!1544857 (= c!141515 (and (not lt!666197) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544857 (= lt!666197 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544858 () Bool)

(declare-fun c!141513 () Bool)

(assert (=> b!1544858 (= c!141513 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666197))))

(declare-fun e!859895 () ListLongMap!22067)

(assert (=> b!1544858 (= e!859890 e!859895)))

(declare-fun b!1544859 () Bool)

(assert (=> b!1544859 (= e!859889 (+!4885 call!69037 (tuple2!24459 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58579 () Bool)

(declare-fun tp!111175 () Bool)

(declare-fun e!859893 () Bool)

(assert (=> mapNonEmpty!58579 (= mapRes!58579 (and tp!111175 e!859893))))

(declare-fun mapKey!58579 () (_ BitVec 32))

(declare-fun mapRest!58579 () (Array (_ BitVec 32) ValueCell!18048))

(declare-fun mapValue!58579 () ValueCell!18048)

(assert (=> mapNonEmpty!58579 (= (arr!49724 _values!470) (store mapRest!58579 mapKey!58579 mapValue!58579))))

(declare-fun res!1059564 () Bool)

(assert (=> start!131928 (=> (not res!1059564) (not e!859894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131928 (= res!1059564 (validMask!0 mask!926))))

(assert (=> start!131928 e!859894))

(declare-fun array_inv!38677 (array!103042) Bool)

(assert (=> start!131928 (array_inv!38677 _keys!618)))

(declare-fun tp_is_empty!37917 () Bool)

(assert (=> start!131928 tp_is_empty!37917))

(assert (=> start!131928 true))

(assert (=> start!131928 tp!111174))

(declare-fun e!859891 () Bool)

(declare-fun array_inv!38678 (array!103044) Bool)

(assert (=> start!131928 (and (array_inv!38678 _values!470) e!859891)))

(declare-fun b!1544853 () Bool)

(assert (=> b!1544853 (= e!859895 call!69035)))

(declare-fun b!1544860 () Bool)

(assert (=> b!1544860 (= e!859895 call!69036)))

(declare-fun b!1544861 () Bool)

(assert (=> b!1544861 (= e!859890 call!69036)))

(declare-fun b!1544862 () Bool)

(declare-fun e!859892 () Bool)

(assert (=> b!1544862 (= e!859891 (and e!859892 mapRes!58579))))

(declare-fun condMapEmpty!58579 () Bool)

(declare-fun mapDefault!58579 () ValueCell!18048)

(assert (=> b!1544862 (= condMapEmpty!58579 (= (arr!49724 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18048)) mapDefault!58579)))))

(declare-fun b!1544863 () Bool)

(assert (=> b!1544863 (= e!859892 tp_is_empty!37917)))

(declare-fun b!1544864 () Bool)

(assert (=> b!1544864 (= e!859893 tp_is_empty!37917)))

(declare-fun bm!69036 () Bool)

(assert (=> bm!69036 (= call!69035 call!69039)))

(assert (= (and start!131928 res!1059564) b!1544856))

(assert (= (and b!1544856 res!1059563) b!1544854))

(assert (= (and b!1544854 res!1059566) b!1544851))

(assert (= (and b!1544851 res!1059567) b!1544855))

(assert (= (and b!1544855 res!1059565) b!1544857))

(assert (= (and b!1544857 c!141515) b!1544859))

(assert (= (and b!1544857 (not c!141515)) b!1544852))

(assert (= (and b!1544852 c!141514) b!1544861))

(assert (= (and b!1544852 (not c!141514)) b!1544858))

(assert (= (and b!1544858 c!141513) b!1544860))

(assert (= (and b!1544858 (not c!141513)) b!1544853))

(assert (= (or b!1544860 b!1544853) bm!69036))

(assert (= (or b!1544861 bm!69036) bm!69033))

(assert (= (or b!1544861 b!1544860) bm!69034))

(assert (= (or b!1544859 bm!69033) bm!69035))

(assert (= (or b!1544859 bm!69034) bm!69032))

(assert (= (and b!1544862 condMapEmpty!58579) mapIsEmpty!58579))

(assert (= (and b!1544862 (not condMapEmpty!58579)) mapNonEmpty!58579))

(get-info :version)

(assert (= (and mapNonEmpty!58579 ((_ is ValueCellFull!18048) mapValue!58579)) b!1544864))

(assert (= (and b!1544862 ((_ is ValueCellFull!18048) mapDefault!58579)) b!1544863))

(assert (= start!131928 b!1544862))

(declare-fun m!1425457 () Bool)

(assert (=> bm!69035 m!1425457))

(declare-fun m!1425459 () Bool)

(assert (=> mapNonEmpty!58579 m!1425459))

(declare-fun m!1425461 () Bool)

(assert (=> b!1544859 m!1425461))

(declare-fun m!1425463 () Bool)

(assert (=> b!1544851 m!1425463))

(declare-fun m!1425465 () Bool)

(assert (=> start!131928 m!1425465))

(declare-fun m!1425467 () Bool)

(assert (=> start!131928 m!1425467))

(declare-fun m!1425469 () Bool)

(assert (=> start!131928 m!1425469))

(declare-fun m!1425471 () Bool)

(assert (=> b!1544854 m!1425471))

(declare-fun m!1425473 () Bool)

(assert (=> bm!69032 m!1425473))

(check-sat (not bm!69035) (not b_next!31641) tp_is_empty!37917 (not mapNonEmpty!58579) (not b!1544851) (not b!1544859) (not b!1544854) (not bm!69032) (not start!131928) b_and!51051)
(check-sat b_and!51051 (not b_next!31641))
