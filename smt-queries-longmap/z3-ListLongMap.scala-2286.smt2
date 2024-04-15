; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37164 () Bool)

(assert start!37164)

(declare-fun b_free!8305 () Bool)

(declare-fun b_next!8305 () Bool)

(assert (=> start!37164 (= b_free!8305 (not b_next!8305))))

(declare-fun tp!29630 () Bool)

(declare-fun b_and!15521 () Bool)

(assert (=> start!37164 (= tp!29630 b_and!15521)))

(declare-fun b!375026 () Bool)

(declare-fun e!228484 () Bool)

(declare-fun e!228483 () Bool)

(declare-fun mapRes!14994 () Bool)

(assert (=> b!375026 (= e!228484 (and e!228483 mapRes!14994))))

(declare-fun condMapEmpty!14994 () Bool)

(declare-datatypes ((V!13043 0))(
  ( (V!13044 (val!4521 Int)) )
))
(declare-datatypes ((ValueCell!4133 0))(
  ( (ValueCellFull!4133 (v!6712 V!13043)) (EmptyCell!4133) )
))
(declare-datatypes ((array!21823 0))(
  ( (array!21824 (arr!10380 (Array (_ BitVec 32) ValueCell!4133)) (size!10733 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21823)

(declare-fun mapDefault!14994 () ValueCell!4133)

(assert (=> b!375026 (= condMapEmpty!14994 (= (arr!10380 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4133)) mapDefault!14994)))))

(declare-fun b!375027 () Bool)

(declare-fun e!228485 () Bool)

(declare-fun tp_is_empty!8953 () Bool)

(assert (=> b!375027 (= e!228485 tp_is_empty!8953)))

(declare-fun b!375028 () Bool)

(declare-fun res!211711 () Bool)

(declare-fun e!228487 () Bool)

(assert (=> b!375028 (=> (not res!211711) (not e!228487))))

(declare-datatypes ((array!21825 0))(
  ( (array!21826 (arr!10381 (Array (_ BitVec 32) (_ BitVec 64))) (size!10734 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21825)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375028 (= res!211711 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14994 () Bool)

(assert (=> mapIsEmpty!14994 mapRes!14994))

(declare-fun b!375030 () Bool)

(declare-fun res!211709 () Bool)

(assert (=> b!375030 (=> (not res!211709) (not e!228487))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21825 (_ BitVec 32)) Bool)

(assert (=> b!375030 (= res!211709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375031 () Bool)

(declare-fun e!228488 () Bool)

(declare-fun e!228481 () Bool)

(assert (=> b!375031 (= e!228488 e!228481)))

(declare-fun res!211704 () Bool)

(assert (=> b!375031 (=> res!211704 e!228481)))

(assert (=> b!375031 (= res!211704 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5990 0))(
  ( (tuple2!5991 (_1!3006 (_ BitVec 64)) (_2!3006 V!13043)) )
))
(declare-datatypes ((List!5823 0))(
  ( (Nil!5820) (Cons!5819 (h!6675 tuple2!5990) (t!10964 List!5823)) )
))
(declare-datatypes ((ListLongMap!4893 0))(
  ( (ListLongMap!4894 (toList!2462 List!5823)) )
))
(declare-fun lt!173356 () ListLongMap!4893)

(declare-fun lt!173355 () ListLongMap!4893)

(assert (=> b!375031 (= lt!173356 lt!173355)))

(declare-fun lt!173359 () ListLongMap!4893)

(declare-fun lt!173348 () tuple2!5990)

(declare-fun +!830 (ListLongMap!4893 tuple2!5990) ListLongMap!4893)

(assert (=> b!375031 (= lt!173355 (+!830 lt!173359 lt!173348))))

(declare-fun lt!173351 () ListLongMap!4893)

(declare-fun zeroValue!472 () V!13043)

(declare-datatypes ((Unit!11532 0))(
  ( (Unit!11533) )
))
(declare-fun lt!173354 () Unit!11532)

(declare-fun v!373 () V!13043)

(declare-fun addCommutativeForDiffKeys!246 (ListLongMap!4893 (_ BitVec 64) V!13043 (_ BitVec 64) V!13043) Unit!11532)

(assert (=> b!375031 (= lt!173354 (addCommutativeForDiffKeys!246 lt!173351 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173362 () ListLongMap!4893)

(declare-fun lt!173360 () tuple2!5990)

(assert (=> b!375031 (= lt!173362 (+!830 lt!173356 lt!173360))))

(declare-fun lt!173357 () ListLongMap!4893)

(declare-fun lt!173363 () tuple2!5990)

(assert (=> b!375031 (= lt!173356 (+!830 lt!173357 lt!173363))))

(declare-fun lt!173353 () ListLongMap!4893)

(declare-fun lt!173350 () ListLongMap!4893)

(assert (=> b!375031 (= lt!173353 lt!173350)))

(assert (=> b!375031 (= lt!173350 (+!830 lt!173359 lt!173360))))

(assert (=> b!375031 (= lt!173359 (+!830 lt!173351 lt!173363))))

(declare-fun lt!173352 () ListLongMap!4893)

(assert (=> b!375031 (= lt!173362 (+!830 (+!830 lt!173352 lt!173363) lt!173360))))

(declare-fun minValue!472 () V!13043)

(assert (=> b!375031 (= lt!173360 (tuple2!5991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375031 (= lt!173363 (tuple2!5991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375032 () Bool)

(assert (=> b!375032 (= e!228481 true)))

(assert (=> b!375032 (= (+!830 lt!173355 lt!173360) (+!830 lt!173350 lt!173348))))

(declare-fun lt!173361 () Unit!11532)

(assert (=> b!375032 (= lt!173361 (addCommutativeForDiffKeys!246 lt!173359 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375033 () Bool)

(declare-fun res!211707 () Bool)

(assert (=> b!375033 (=> (not res!211707) (not e!228487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375033 (= res!211707 (validKeyInArray!0 k0!778))))

(declare-fun b!375034 () Bool)

(assert (=> b!375034 (= e!228483 tp_is_empty!8953)))

(declare-fun b!375029 () Bool)

(declare-fun e!228482 () Bool)

(assert (=> b!375029 (= e!228487 e!228482)))

(declare-fun res!211710 () Bool)

(assert (=> b!375029 (=> (not res!211710) (not e!228482))))

(declare-fun lt!173364 () array!21825)

(assert (=> b!375029 (= res!211710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173364 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375029 (= lt!173364 (array!21826 (store (arr!10381 _keys!658) i!548 k0!778) (size!10734 _keys!658)))))

(declare-fun res!211705 () Bool)

(assert (=> start!37164 (=> (not res!211705) (not e!228487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37164 (= res!211705 (validMask!0 mask!970))))

(assert (=> start!37164 e!228487))

(declare-fun array_inv!7660 (array!21823) Bool)

(assert (=> start!37164 (and (array_inv!7660 _values!506) e!228484)))

(assert (=> start!37164 tp!29630))

(assert (=> start!37164 true))

(assert (=> start!37164 tp_is_empty!8953))

(declare-fun array_inv!7661 (array!21825) Bool)

(assert (=> start!37164 (array_inv!7661 _keys!658)))

(declare-fun b!375035 () Bool)

(declare-fun res!211712 () Bool)

(assert (=> b!375035 (=> (not res!211712) (not e!228487))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375035 (= res!211712 (and (= (size!10733 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10734 _keys!658) (size!10733 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375036 () Bool)

(declare-fun res!211708 () Bool)

(assert (=> b!375036 (=> (not res!211708) (not e!228487))))

(declare-datatypes ((List!5824 0))(
  ( (Nil!5821) (Cons!5820 (h!6676 (_ BitVec 64)) (t!10965 List!5824)) )
))
(declare-fun arrayNoDuplicates!0 (array!21825 (_ BitVec 32) List!5824) Bool)

(assert (=> b!375036 (= res!211708 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5821))))

(declare-fun b!375037 () Bool)

(assert (=> b!375037 (= e!228482 (not e!228488))))

(declare-fun res!211702 () Bool)

(assert (=> b!375037 (=> res!211702 e!228488)))

(assert (=> b!375037 (= res!211702 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1878 (array!21825 array!21823 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4893)

(assert (=> b!375037 (= lt!173353 (getCurrentListMap!1878 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173358 () array!21823)

(assert (=> b!375037 (= lt!173362 (getCurrentListMap!1878 lt!173364 lt!173358 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375037 (and (= lt!173352 lt!173357) (= lt!173357 lt!173352))))

(assert (=> b!375037 (= lt!173357 (+!830 lt!173351 lt!173348))))

(assert (=> b!375037 (= lt!173348 (tuple2!5991 k0!778 v!373))))

(declare-fun lt!173349 () Unit!11532)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 (array!21825 array!21823 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) (_ BitVec 64) V!13043 (_ BitVec 32) Int) Unit!11532)

(assert (=> b!375037 (= lt!173349 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!743 (array!21825 array!21823 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4893)

(assert (=> b!375037 (= lt!173352 (getCurrentListMapNoExtraKeys!743 lt!173364 lt!173358 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375037 (= lt!173358 (array!21824 (store (arr!10380 _values!506) i!548 (ValueCellFull!4133 v!373)) (size!10733 _values!506)))))

(assert (=> b!375037 (= lt!173351 (getCurrentListMapNoExtraKeys!743 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375038 () Bool)

(declare-fun res!211706 () Bool)

(assert (=> b!375038 (=> (not res!211706) (not e!228487))))

(assert (=> b!375038 (= res!211706 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10734 _keys!658))))))

(declare-fun mapNonEmpty!14994 () Bool)

(declare-fun tp!29631 () Bool)

(assert (=> mapNonEmpty!14994 (= mapRes!14994 (and tp!29631 e!228485))))

(declare-fun mapKey!14994 () (_ BitVec 32))

(declare-fun mapValue!14994 () ValueCell!4133)

(declare-fun mapRest!14994 () (Array (_ BitVec 32) ValueCell!4133))

(assert (=> mapNonEmpty!14994 (= (arr!10380 _values!506) (store mapRest!14994 mapKey!14994 mapValue!14994))))

(declare-fun b!375039 () Bool)

(declare-fun res!211703 () Bool)

(assert (=> b!375039 (=> (not res!211703) (not e!228487))))

(assert (=> b!375039 (= res!211703 (or (= (select (arr!10381 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10381 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375040 () Bool)

(declare-fun res!211701 () Bool)

(assert (=> b!375040 (=> (not res!211701) (not e!228482))))

(assert (=> b!375040 (= res!211701 (arrayNoDuplicates!0 lt!173364 #b00000000000000000000000000000000 Nil!5821))))

(assert (= (and start!37164 res!211705) b!375035))

(assert (= (and b!375035 res!211712) b!375030))

(assert (= (and b!375030 res!211709) b!375036))

(assert (= (and b!375036 res!211708) b!375038))

(assert (= (and b!375038 res!211706) b!375033))

(assert (= (and b!375033 res!211707) b!375039))

(assert (= (and b!375039 res!211703) b!375028))

(assert (= (and b!375028 res!211711) b!375029))

(assert (= (and b!375029 res!211710) b!375040))

(assert (= (and b!375040 res!211701) b!375037))

(assert (= (and b!375037 (not res!211702)) b!375031))

(assert (= (and b!375031 (not res!211704)) b!375032))

(assert (= (and b!375026 condMapEmpty!14994) mapIsEmpty!14994))

(assert (= (and b!375026 (not condMapEmpty!14994)) mapNonEmpty!14994))

(get-info :version)

(assert (= (and mapNonEmpty!14994 ((_ is ValueCellFull!4133) mapValue!14994)) b!375027))

(assert (= (and b!375026 ((_ is ValueCellFull!4133) mapDefault!14994)) b!375034))

(assert (= start!37164 b!375026))

(declare-fun m!371111 () Bool)

(assert (=> b!375033 m!371111))

(declare-fun m!371113 () Bool)

(assert (=> b!375036 m!371113))

(declare-fun m!371115 () Bool)

(assert (=> b!375030 m!371115))

(declare-fun m!371117 () Bool)

(assert (=> b!375040 m!371117))

(declare-fun m!371119 () Bool)

(assert (=> b!375037 m!371119))

(declare-fun m!371121 () Bool)

(assert (=> b!375037 m!371121))

(declare-fun m!371123 () Bool)

(assert (=> b!375037 m!371123))

(declare-fun m!371125 () Bool)

(assert (=> b!375037 m!371125))

(declare-fun m!371127 () Bool)

(assert (=> b!375037 m!371127))

(declare-fun m!371129 () Bool)

(assert (=> b!375037 m!371129))

(declare-fun m!371131 () Bool)

(assert (=> b!375037 m!371131))

(declare-fun m!371133 () Bool)

(assert (=> b!375028 m!371133))

(declare-fun m!371135 () Bool)

(assert (=> mapNonEmpty!14994 m!371135))

(declare-fun m!371137 () Bool)

(assert (=> b!375032 m!371137))

(declare-fun m!371139 () Bool)

(assert (=> b!375032 m!371139))

(declare-fun m!371141 () Bool)

(assert (=> b!375032 m!371141))

(declare-fun m!371143 () Bool)

(assert (=> b!375031 m!371143))

(declare-fun m!371145 () Bool)

(assert (=> b!375031 m!371145))

(declare-fun m!371147 () Bool)

(assert (=> b!375031 m!371147))

(declare-fun m!371149 () Bool)

(assert (=> b!375031 m!371149))

(declare-fun m!371151 () Bool)

(assert (=> b!375031 m!371151))

(declare-fun m!371153 () Bool)

(assert (=> b!375031 m!371153))

(declare-fun m!371155 () Bool)

(assert (=> b!375031 m!371155))

(assert (=> b!375031 m!371151))

(declare-fun m!371157 () Bool)

(assert (=> b!375031 m!371157))

(declare-fun m!371159 () Bool)

(assert (=> start!37164 m!371159))

(declare-fun m!371161 () Bool)

(assert (=> start!37164 m!371161))

(declare-fun m!371163 () Bool)

(assert (=> start!37164 m!371163))

(declare-fun m!371165 () Bool)

(assert (=> b!375029 m!371165))

(declare-fun m!371167 () Bool)

(assert (=> b!375029 m!371167))

(declare-fun m!371169 () Bool)

(assert (=> b!375039 m!371169))

(check-sat (not b!375031) (not b!375036) (not b!375032) (not b_next!8305) (not mapNonEmpty!14994) (not b!375028) (not b!375037) b_and!15521 (not b!375029) (not start!37164) tp_is_empty!8953 (not b!375033) (not b!375040) (not b!375030))
(check-sat b_and!15521 (not b_next!8305))
