; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82184 () Bool)

(assert start!82184)

(declare-fun b_free!18439 () Bool)

(declare-fun b_next!18439 () Bool)

(assert (=> start!82184 (= b_free!18439 (not b_next!18439))))

(declare-fun tp!64126 () Bool)

(declare-fun b_and!29935 () Bool)

(assert (=> start!82184 (= tp!64126 b_and!29935)))

(declare-fun b!957436 () Bool)

(declare-fun res!640799 () Bool)

(declare-fun e!539605 () Bool)

(assert (=> b!957436 (=> (not res!640799) (not e!539605))))

(declare-datatypes ((array!58248 0))(
  ( (array!58249 (arr!27999 (Array (_ BitVec 32) (_ BitVec 64))) (size!28479 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58248)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957436 (= res!640799 (validKeyInArray!0 (select (arr!27999 _keys!1441) i!735)))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33057 0))(
  ( (V!33058 (val!10578 Int)) )
))
(declare-fun zeroValue!1139 () V!33057)

(declare-fun b!957437 () Bool)

(declare-datatypes ((ValueCell!10046 0))(
  ( (ValueCellFull!10046 (v!13130 V!33057)) (EmptyCell!10046) )
))
(declare-datatypes ((array!58250 0))(
  ( (array!58251 (arr!28000 (Array (_ BitVec 32) ValueCell!10046)) (size!28480 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58250)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!33057)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13674 0))(
  ( (tuple2!13675 (_1!6848 (_ BitVec 64)) (_2!6848 V!33057)) )
))
(declare-datatypes ((List!19483 0))(
  ( (Nil!19480) (Cons!19479 (h!20647 tuple2!13674) (t!27836 List!19483)) )
))
(declare-datatypes ((ListLongMap!12373 0))(
  ( (ListLongMap!12374 (toList!6202 List!19483)) )
))
(declare-fun contains!5311 (ListLongMap!12373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3435 (array!58248 array!58250 (_ BitVec 32) (_ BitVec 32) V!33057 V!33057 (_ BitVec 32) Int) ListLongMap!12373)

(assert (=> b!957437 (= e!539605 (not (contains!5311 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27999 _keys!1441) i!735))))))

(declare-fun b!957439 () Bool)

(declare-fun res!640794 () Bool)

(assert (=> b!957439 (=> (not res!640794) (not e!539605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58248 (_ BitVec 32)) Bool)

(assert (=> b!957439 (= res!640794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33544 () Bool)

(declare-fun mapRes!33544 () Bool)

(declare-fun tp!64125 () Bool)

(declare-fun e!539603 () Bool)

(assert (=> mapNonEmpty!33544 (= mapRes!33544 (and tp!64125 e!539603))))

(declare-fun mapValue!33544 () ValueCell!10046)

(declare-fun mapKey!33544 () (_ BitVec 32))

(declare-fun mapRest!33544 () (Array (_ BitVec 32) ValueCell!10046))

(assert (=> mapNonEmpty!33544 (= (arr!28000 _values!1197) (store mapRest!33544 mapKey!33544 mapValue!33544))))

(declare-fun b!957440 () Bool)

(declare-fun res!640795 () Bool)

(assert (=> b!957440 (=> (not res!640795) (not e!539605))))

(assert (=> b!957440 (= res!640795 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28479 _keys!1441))))))

(declare-fun b!957441 () Bool)

(declare-fun res!640798 () Bool)

(assert (=> b!957441 (=> (not res!640798) (not e!539605))))

(declare-datatypes ((List!19484 0))(
  ( (Nil!19481) (Cons!19480 (h!20648 (_ BitVec 64)) (t!27837 List!19484)) )
))
(declare-fun arrayNoDuplicates!0 (array!58248 (_ BitVec 32) List!19484) Bool)

(assert (=> b!957441 (= res!640798 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19481))))

(declare-fun b!957442 () Bool)

(declare-fun tp_is_empty!21055 () Bool)

(assert (=> b!957442 (= e!539603 tp_is_empty!21055)))

(declare-fun mapIsEmpty!33544 () Bool)

(assert (=> mapIsEmpty!33544 mapRes!33544))

(declare-fun b!957443 () Bool)

(declare-fun e!539604 () Bool)

(assert (=> b!957443 (= e!539604 tp_is_empty!21055)))

(declare-fun b!957444 () Bool)

(declare-fun e!539602 () Bool)

(assert (=> b!957444 (= e!539602 (and e!539604 mapRes!33544))))

(declare-fun condMapEmpty!33544 () Bool)

(declare-fun mapDefault!33544 () ValueCell!10046)

(assert (=> b!957444 (= condMapEmpty!33544 (= (arr!28000 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10046)) mapDefault!33544)))))

(declare-fun b!957438 () Bool)

(declare-fun res!640797 () Bool)

(assert (=> b!957438 (=> (not res!640797) (not e!539605))))

(assert (=> b!957438 (= res!640797 (and (= (size!28480 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28479 _keys!1441) (size!28480 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640796 () Bool)

(assert (=> start!82184 (=> (not res!640796) (not e!539605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82184 (= res!640796 (validMask!0 mask!1823))))

(assert (=> start!82184 e!539605))

(assert (=> start!82184 true))

(assert (=> start!82184 tp_is_empty!21055))

(declare-fun array_inv!21797 (array!58248) Bool)

(assert (=> start!82184 (array_inv!21797 _keys!1441)))

(declare-fun array_inv!21798 (array!58250) Bool)

(assert (=> start!82184 (and (array_inv!21798 _values!1197) e!539602)))

(assert (=> start!82184 tp!64126))

(assert (= (and start!82184 res!640796) b!957438))

(assert (= (and b!957438 res!640797) b!957439))

(assert (= (and b!957439 res!640794) b!957441))

(assert (= (and b!957441 res!640798) b!957440))

(assert (= (and b!957440 res!640795) b!957436))

(assert (= (and b!957436 res!640799) b!957437))

(assert (= (and b!957444 condMapEmpty!33544) mapIsEmpty!33544))

(assert (= (and b!957444 (not condMapEmpty!33544)) mapNonEmpty!33544))

(get-info :version)

(assert (= (and mapNonEmpty!33544 ((_ is ValueCellFull!10046) mapValue!33544)) b!957442))

(assert (= (and b!957444 ((_ is ValueCellFull!10046) mapDefault!33544)) b!957443))

(assert (= start!82184 b!957444))

(declare-fun m!889071 () Bool)

(assert (=> start!82184 m!889071))

(declare-fun m!889073 () Bool)

(assert (=> start!82184 m!889073))

(declare-fun m!889075 () Bool)

(assert (=> start!82184 m!889075))

(declare-fun m!889077 () Bool)

(assert (=> mapNonEmpty!33544 m!889077))

(declare-fun m!889079 () Bool)

(assert (=> b!957439 m!889079))

(declare-fun m!889081 () Bool)

(assert (=> b!957437 m!889081))

(declare-fun m!889083 () Bool)

(assert (=> b!957437 m!889083))

(assert (=> b!957437 m!889081))

(assert (=> b!957437 m!889083))

(declare-fun m!889085 () Bool)

(assert (=> b!957437 m!889085))

(assert (=> b!957436 m!889083))

(assert (=> b!957436 m!889083))

(declare-fun m!889087 () Bool)

(assert (=> b!957436 m!889087))

(declare-fun m!889089 () Bool)

(assert (=> b!957441 m!889089))

(check-sat tp_is_empty!21055 (not b!957441) (not mapNonEmpty!33544) (not start!82184) (not b!957437) (not b_next!18439) (not b!957436) b_and!29935 (not b!957439))
(check-sat b_and!29935 (not b_next!18439))
(get-model)

(declare-fun d!116161 () Bool)

(assert (=> d!116161 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!82184 d!116161))

(declare-fun d!116163 () Bool)

(assert (=> d!116163 (= (array_inv!21797 _keys!1441) (bvsge (size!28479 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!82184 d!116163))

(declare-fun d!116165 () Bool)

(assert (=> d!116165 (= (array_inv!21798 _values!1197) (bvsge (size!28480 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!82184 d!116165))

(declare-fun b!957507 () Bool)

(declare-fun e!539643 () Bool)

(declare-fun call!41726 () Bool)

(assert (=> b!957507 (= e!539643 call!41726)))

(declare-fun d!116167 () Bool)

(declare-fun res!640840 () Bool)

(declare-fun e!539642 () Bool)

(assert (=> d!116167 (=> res!640840 e!539642)))

(assert (=> d!116167 (= res!640840 (bvsge #b00000000000000000000000000000000 (size!28479 _keys!1441)))))

(assert (=> d!116167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!539642)))

(declare-fun b!957508 () Bool)

(declare-fun e!539644 () Bool)

(assert (=> b!957508 (= e!539644 call!41726)))

(declare-fun bm!41723 () Bool)

(assert (=> bm!41723 (= call!41726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!957509 () Bool)

(assert (=> b!957509 (= e!539642 e!539643)))

(declare-fun c!100151 () Bool)

(assert (=> b!957509 (= c!100151 (validKeyInArray!0 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!957510 () Bool)

(assert (=> b!957510 (= e!539643 e!539644)))

(declare-fun lt!430525 () (_ BitVec 64))

(assert (=> b!957510 (= lt!430525 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32106 0))(
  ( (Unit!32107) )
))
(declare-fun lt!430526 () Unit!32106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58248 (_ BitVec 64) (_ BitVec 32)) Unit!32106)

(assert (=> b!957510 (= lt!430526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957510 (arrayContainsKey!0 _keys!1441 lt!430525 #b00000000000000000000000000000000)))

(declare-fun lt!430527 () Unit!32106)

(assert (=> b!957510 (= lt!430527 lt!430526)))

(declare-fun res!640841 () Bool)

(declare-datatypes ((SeekEntryResult!9143 0))(
  ( (MissingZero!9143 (index!38943 (_ BitVec 32))) (Found!9143 (index!38944 (_ BitVec 32))) (Intermediate!9143 (undefined!9955 Bool) (index!38945 (_ BitVec 32)) (x!82401 (_ BitVec 32))) (Undefined!9143) (MissingVacant!9143 (index!38946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58248 (_ BitVec 32)) SeekEntryResult!9143)

(assert (=> b!957510 (= res!640841 (= (seekEntryOrOpen!0 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9143 #b00000000000000000000000000000000)))))

(assert (=> b!957510 (=> (not res!640841) (not e!539644))))

(assert (= (and d!116167 (not res!640840)) b!957509))

(assert (= (and b!957509 c!100151) b!957510))

(assert (= (and b!957509 (not c!100151)) b!957507))

(assert (= (and b!957510 res!640841) b!957508))

(assert (= (or b!957508 b!957507) bm!41723))

(declare-fun m!889131 () Bool)

(assert (=> bm!41723 m!889131))

(declare-fun m!889133 () Bool)

(assert (=> b!957509 m!889133))

(assert (=> b!957509 m!889133))

(declare-fun m!889135 () Bool)

(assert (=> b!957509 m!889135))

(assert (=> b!957510 m!889133))

(declare-fun m!889137 () Bool)

(assert (=> b!957510 m!889137))

(declare-fun m!889139 () Bool)

(assert (=> b!957510 m!889139))

(assert (=> b!957510 m!889133))

(declare-fun m!889141 () Bool)

(assert (=> b!957510 m!889141))

(assert (=> b!957439 d!116167))

(declare-fun bm!41726 () Bool)

(declare-fun call!41729 () Bool)

(declare-fun c!100154 () Bool)

(assert (=> bm!41726 (= call!41729 (arrayNoDuplicates!0 _keys!1441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100154 (Cons!19480 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000) Nil!19481) Nil!19481)))))

(declare-fun b!957521 () Bool)

(declare-fun e!539656 () Bool)

(declare-fun e!539653 () Bool)

(assert (=> b!957521 (= e!539656 e!539653)))

(declare-fun res!640850 () Bool)

(assert (=> b!957521 (=> (not res!640850) (not e!539653))))

(declare-fun e!539654 () Bool)

(assert (=> b!957521 (= res!640850 (not e!539654))))

(declare-fun res!640848 () Bool)

(assert (=> b!957521 (=> (not res!640848) (not e!539654))))

(assert (=> b!957521 (= res!640848 (validKeyInArray!0 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!957522 () Bool)

(declare-fun contains!5313 (List!19484 (_ BitVec 64)) Bool)

(assert (=> b!957522 (= e!539654 (contains!5313 Nil!19481 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun d!116169 () Bool)

(declare-fun res!640849 () Bool)

(assert (=> d!116169 (=> res!640849 e!539656)))

(assert (=> d!116169 (= res!640849 (bvsge #b00000000000000000000000000000000 (size!28479 _keys!1441)))))

(assert (=> d!116169 (= (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19481) e!539656)))

(declare-fun b!957523 () Bool)

(declare-fun e!539655 () Bool)

(assert (=> b!957523 (= e!539655 call!41729)))

(declare-fun b!957524 () Bool)

(assert (=> b!957524 (= e!539653 e!539655)))

(assert (=> b!957524 (= c!100154 (validKeyInArray!0 (select (arr!27999 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!957525 () Bool)

(assert (=> b!957525 (= e!539655 call!41729)))

(assert (= (and d!116169 (not res!640849)) b!957521))

(assert (= (and b!957521 res!640848) b!957522))

(assert (= (and b!957521 res!640850) b!957524))

(assert (= (and b!957524 c!100154) b!957525))

(assert (= (and b!957524 (not c!100154)) b!957523))

(assert (= (or b!957525 b!957523) bm!41726))

(assert (=> bm!41726 m!889133))

(declare-fun m!889143 () Bool)

(assert (=> bm!41726 m!889143))

(assert (=> b!957521 m!889133))

(assert (=> b!957521 m!889133))

(assert (=> b!957521 m!889135))

(assert (=> b!957522 m!889133))

(assert (=> b!957522 m!889133))

(declare-fun m!889145 () Bool)

(assert (=> b!957522 m!889145))

(assert (=> b!957524 m!889133))

(assert (=> b!957524 m!889133))

(assert (=> b!957524 m!889135))

(assert (=> b!957441 d!116169))

(declare-fun d!116171 () Bool)

(declare-fun e!539662 () Bool)

(assert (=> d!116171 e!539662))

(declare-fun res!640853 () Bool)

(assert (=> d!116171 (=> res!640853 e!539662)))

(declare-fun lt!430539 () Bool)

(assert (=> d!116171 (= res!640853 (not lt!430539))))

(declare-fun lt!430537 () Bool)

(assert (=> d!116171 (= lt!430539 lt!430537)))

(declare-fun lt!430536 () Unit!32106)

(declare-fun e!539661 () Unit!32106)

(assert (=> d!116171 (= lt!430536 e!539661)))

(declare-fun c!100157 () Bool)

(assert (=> d!116171 (= c!100157 lt!430537)))

(declare-fun containsKey!477 (List!19483 (_ BitVec 64)) Bool)

(assert (=> d!116171 (= lt!430537 (containsKey!477 (toList!6202 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27999 _keys!1441) i!735)))))

(assert (=> d!116171 (= (contains!5311 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27999 _keys!1441) i!735)) lt!430539)))

(declare-fun b!957532 () Bool)

(declare-fun lt!430538 () Unit!32106)

(assert (=> b!957532 (= e!539661 lt!430538)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!371 (List!19483 (_ BitVec 64)) Unit!32106)

(assert (=> b!957532 (= lt!430538 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6202 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27999 _keys!1441) i!735)))))

(declare-datatypes ((Option!512 0))(
  ( (Some!511 (v!13133 V!33057)) (None!510) )
))
(declare-fun isDefined!379 (Option!512) Bool)

(declare-fun getValueByKey!506 (List!19483 (_ BitVec 64)) Option!512)

(assert (=> b!957532 (isDefined!379 (getValueByKey!506 (toList!6202 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27999 _keys!1441) i!735)))))

(declare-fun b!957533 () Bool)

(declare-fun Unit!32108 () Unit!32106)

(assert (=> b!957533 (= e!539661 Unit!32108)))

(declare-fun b!957534 () Bool)

(assert (=> b!957534 (= e!539662 (isDefined!379 (getValueByKey!506 (toList!6202 (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27999 _keys!1441) i!735))))))

(assert (= (and d!116171 c!100157) b!957532))

(assert (= (and d!116171 (not c!100157)) b!957533))

(assert (= (and d!116171 (not res!640853)) b!957534))

(assert (=> d!116171 m!889083))

(declare-fun m!889147 () Bool)

(assert (=> d!116171 m!889147))

(assert (=> b!957532 m!889083))

(declare-fun m!889149 () Bool)

(assert (=> b!957532 m!889149))

(assert (=> b!957532 m!889083))

(declare-fun m!889151 () Bool)

(assert (=> b!957532 m!889151))

(assert (=> b!957532 m!889151))

(declare-fun m!889153 () Bool)

(assert (=> b!957532 m!889153))

(assert (=> b!957534 m!889083))

(assert (=> b!957534 m!889151))

(assert (=> b!957534 m!889151))

(assert (=> b!957534 m!889153))

(assert (=> b!957437 d!116171))

(declare-fun b!957577 () Bool)

(declare-fun e!539690 () Bool)

(declare-fun e!539693 () Bool)

(assert (=> b!957577 (= e!539690 e!539693)))

(declare-fun res!640875 () Bool)

(declare-fun call!41748 () Bool)

(assert (=> b!957577 (= res!640875 call!41748)))

(assert (=> b!957577 (=> (not res!640875) (not e!539693))))

(declare-fun b!957578 () Bool)

(declare-fun e!539692 () ListLongMap!12373)

(declare-fun call!41746 () ListLongMap!12373)

(assert (=> b!957578 (= e!539692 call!41746)))

(declare-fun b!957579 () Bool)

(declare-fun e!539700 () Bool)

(assert (=> b!957579 (= e!539700 (validKeyInArray!0 (select (arr!27999 _keys!1441) i!735)))))

(declare-fun bm!41741 () Bool)

(declare-fun lt!430596 () ListLongMap!12373)

(assert (=> bm!41741 (= call!41748 (contains!5311 lt!430596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41742 () Bool)

(declare-fun call!41750 () ListLongMap!12373)

(assert (=> bm!41742 (= call!41746 call!41750)))

(declare-fun b!957580 () Bool)

(declare-fun apply!898 (ListLongMap!12373 (_ BitVec 64)) V!33057)

(assert (=> b!957580 (= e!539693 (= (apply!898 lt!430596 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1139))))

(declare-fun b!957581 () Bool)

(declare-fun e!539696 () ListLongMap!12373)

(declare-fun e!539694 () ListLongMap!12373)

(assert (=> b!957581 (= e!539696 e!539694)))

(declare-fun c!100171 () Bool)

(assert (=> b!957581 (= c!100171 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!100173 () Bool)

(declare-fun call!41747 () ListLongMap!12373)

(declare-fun call!41749 () ListLongMap!12373)

(declare-fun bm!41743 () Bool)

(declare-fun +!2884 (ListLongMap!12373 tuple2!13674) ListLongMap!12373)

(assert (=> bm!41743 (= call!41747 (+!2884 (ite c!100173 call!41749 (ite c!100171 call!41750 call!41746)) (ite (or c!100173 c!100171) (tuple2!13675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1139) (tuple2!13675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139))))))

(declare-fun b!957582 () Bool)

(declare-fun call!41744 () ListLongMap!12373)

(assert (=> b!957582 (= e!539692 call!41744)))

(declare-fun bm!41744 () Bool)

(assert (=> bm!41744 (= call!41750 call!41749)))

(declare-fun b!957583 () Bool)

(assert (=> b!957583 (= e!539690 (not call!41748))))

(declare-fun bm!41745 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3372 (array!58248 array!58250 (_ BitVec 32) (_ BitVec 32) V!33057 V!33057 (_ BitVec 32) Int) ListLongMap!12373)

(assert (=> bm!41745 (= call!41749 (getCurrentListMapNoExtraKeys!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun b!957584 () Bool)

(declare-fun e!539701 () Bool)

(declare-fun e!539698 () Bool)

(assert (=> b!957584 (= e!539701 e!539698)))

(declare-fun c!100170 () Bool)

(assert (=> b!957584 (= c!100170 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41746 () Bool)

(assert (=> bm!41746 (= call!41744 call!41747)))

(declare-fun e!539689 () Bool)

(declare-fun b!957585 () Bool)

(declare-fun get!14695 (ValueCell!10046 V!33057) V!33057)

(declare-fun dynLambda!1681 (Int (_ BitVec 64)) V!33057)

(assert (=> b!957585 (= e!539689 (= (apply!898 lt!430596 (select (arr!27999 _keys!1441) i!735)) (get!14695 (select (arr!28000 _values!1197) i!735) (dynLambda!1681 defaultEntry!1205 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!957585 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28480 _values!1197)))))

(assert (=> b!957585 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28479 _keys!1441)))))

(declare-fun b!957586 () Bool)

(assert (=> b!957586 (= e!539696 (+!2884 call!41747 (tuple2!13675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139)))))

(declare-fun b!957587 () Bool)

(declare-fun e!539695 () Unit!32106)

(declare-fun Unit!32109 () Unit!32106)

(assert (=> b!957587 (= e!539695 Unit!32109)))

(declare-fun b!957588 () Bool)

(declare-fun call!41745 () Bool)

(assert (=> b!957588 (= e!539698 (not call!41745))))

(declare-fun b!957589 () Bool)

(declare-fun res!640879 () Bool)

(assert (=> b!957589 (=> (not res!640879) (not e!539701))))

(declare-fun e!539699 () Bool)

(assert (=> b!957589 (= res!640879 e!539699)))

(declare-fun res!640880 () Bool)

(assert (=> b!957589 (=> res!640880 e!539699)))

(assert (=> b!957589 (= res!640880 (not e!539700))))

(declare-fun res!640877 () Bool)

(assert (=> b!957589 (=> (not res!640877) (not e!539700))))

(assert (=> b!957589 (= res!640877 (bvslt i!735 (size!28479 _keys!1441)))))

(declare-fun b!957590 () Bool)

(assert (=> b!957590 (= e!539694 call!41744)))

(declare-fun b!957591 () Bool)

(declare-fun lt!430601 () Unit!32106)

(assert (=> b!957591 (= e!539695 lt!430601)))

(declare-fun lt!430597 () ListLongMap!12373)

(assert (=> b!957591 (= lt!430597 (getCurrentListMapNoExtraKeys!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430599 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430586 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430586 (select (arr!27999 _keys!1441) i!735))))

(declare-fun lt!430600 () Unit!32106)

(declare-fun addStillContains!587 (ListLongMap!12373 (_ BitVec 64) V!33057 (_ BitVec 64)) Unit!32106)

(assert (=> b!957591 (= lt!430600 (addStillContains!587 lt!430597 lt!430599 zeroValue!1139 lt!430586))))

(assert (=> b!957591 (contains!5311 (+!2884 lt!430597 (tuple2!13675 lt!430599 zeroValue!1139)) lt!430586)))

(declare-fun lt!430603 () Unit!32106)

(assert (=> b!957591 (= lt!430603 lt!430600)))

(declare-fun lt!430585 () ListLongMap!12373)

(assert (=> b!957591 (= lt!430585 (getCurrentListMapNoExtraKeys!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430602 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430590 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430590 (select (arr!27999 _keys!1441) i!735))))

(declare-fun lt!430584 () Unit!32106)

(declare-fun addApplyDifferent!468 (ListLongMap!12373 (_ BitVec 64) V!33057 (_ BitVec 64)) Unit!32106)

(assert (=> b!957591 (= lt!430584 (addApplyDifferent!468 lt!430585 lt!430602 minValue!1139 lt!430590))))

(assert (=> b!957591 (= (apply!898 (+!2884 lt!430585 (tuple2!13675 lt!430602 minValue!1139)) lt!430590) (apply!898 lt!430585 lt!430590))))

(declare-fun lt!430588 () Unit!32106)

(assert (=> b!957591 (= lt!430588 lt!430584)))

(declare-fun lt!430604 () ListLongMap!12373)

(assert (=> b!957591 (= lt!430604 (getCurrentListMapNoExtraKeys!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430589 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430589 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430592 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430592 (select (arr!27999 _keys!1441) i!735))))

(declare-fun lt!430598 () Unit!32106)

(assert (=> b!957591 (= lt!430598 (addApplyDifferent!468 lt!430604 lt!430589 zeroValue!1139 lt!430592))))

(assert (=> b!957591 (= (apply!898 (+!2884 lt!430604 (tuple2!13675 lt!430589 zeroValue!1139)) lt!430592) (apply!898 lt!430604 lt!430592))))

(declare-fun lt!430593 () Unit!32106)

(assert (=> b!957591 (= lt!430593 lt!430598)))

(declare-fun lt!430595 () ListLongMap!12373)

(assert (=> b!957591 (= lt!430595 (getCurrentListMapNoExtraKeys!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430587 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430605 () (_ BitVec 64))

(assert (=> b!957591 (= lt!430605 (select (arr!27999 _keys!1441) i!735))))

(assert (=> b!957591 (= lt!430601 (addApplyDifferent!468 lt!430595 lt!430587 minValue!1139 lt!430605))))

(assert (=> b!957591 (= (apply!898 (+!2884 lt!430595 (tuple2!13675 lt!430587 minValue!1139)) lt!430605) (apply!898 lt!430595 lt!430605))))

(declare-fun b!957592 () Bool)

(declare-fun res!640876 () Bool)

(assert (=> b!957592 (=> (not res!640876) (not e!539701))))

(assert (=> b!957592 (= res!640876 e!539690)))

(declare-fun c!100172 () Bool)

(assert (=> b!957592 (= c!100172 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41747 () Bool)

(assert (=> bm!41747 (= call!41745 (contains!5311 lt!430596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!957593 () Bool)

(declare-fun e!539697 () Bool)

(assert (=> b!957593 (= e!539697 (validKeyInArray!0 (select (arr!27999 _keys!1441) i!735)))))

(declare-fun b!957594 () Bool)

(assert (=> b!957594 (= e!539699 e!539689)))

(declare-fun res!640878 () Bool)

(assert (=> b!957594 (=> (not res!640878) (not e!539689))))

(assert (=> b!957594 (= res!640878 (contains!5311 lt!430596 (select (arr!27999 _keys!1441) i!735)))))

(assert (=> b!957594 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28479 _keys!1441)))))

(declare-fun b!957595 () Bool)

(declare-fun e!539691 () Bool)

(assert (=> b!957595 (= e!539698 e!539691)))

(declare-fun res!640872 () Bool)

(assert (=> b!957595 (= res!640872 call!41745)))

(assert (=> b!957595 (=> (not res!640872) (not e!539691))))

(declare-fun d!116173 () Bool)

(assert (=> d!116173 e!539701))

(declare-fun res!640874 () Bool)

(assert (=> d!116173 (=> (not res!640874) (not e!539701))))

(assert (=> d!116173 (= res!640874 (or (bvsge i!735 (size!28479 _keys!1441)) (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28479 _keys!1441)))))))

(declare-fun lt!430591 () ListLongMap!12373)

(assert (=> d!116173 (= lt!430596 lt!430591)))

(declare-fun lt!430594 () Unit!32106)

(assert (=> d!116173 (= lt!430594 e!539695)))

(declare-fun c!100174 () Bool)

(assert (=> d!116173 (= c!100174 e!539697)))

(declare-fun res!640873 () Bool)

(assert (=> d!116173 (=> (not res!640873) (not e!539697))))

(assert (=> d!116173 (= res!640873 (bvslt i!735 (size!28479 _keys!1441)))))

(assert (=> d!116173 (= lt!430591 e!539696)))

(assert (=> d!116173 (= c!100173 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116173 (validMask!0 mask!1823)))

(assert (=> d!116173 (= (getCurrentListMap!3435 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) lt!430596)))

(declare-fun b!957596 () Bool)

(assert (=> b!957596 (= e!539691 (= (apply!898 lt!430596 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1139))))

(declare-fun b!957597 () Bool)

(declare-fun c!100175 () Bool)

(assert (=> b!957597 (= c!100175 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!957597 (= e!539694 e!539692)))

(assert (= (and d!116173 c!100173) b!957586))

(assert (= (and d!116173 (not c!100173)) b!957581))

(assert (= (and b!957581 c!100171) b!957590))

(assert (= (and b!957581 (not c!100171)) b!957597))

(assert (= (and b!957597 c!100175) b!957582))

(assert (= (and b!957597 (not c!100175)) b!957578))

(assert (= (or b!957582 b!957578) bm!41742))

(assert (= (or b!957590 bm!41742) bm!41744))

(assert (= (or b!957590 b!957582) bm!41746))

(assert (= (or b!957586 bm!41744) bm!41745))

(assert (= (or b!957586 bm!41746) bm!41743))

(assert (= (and d!116173 res!640873) b!957593))

(assert (= (and d!116173 c!100174) b!957591))

(assert (= (and d!116173 (not c!100174)) b!957587))

(assert (= (and d!116173 res!640874) b!957589))

(assert (= (and b!957589 res!640877) b!957579))

(assert (= (and b!957589 (not res!640880)) b!957594))

(assert (= (and b!957594 res!640878) b!957585))

(assert (= (and b!957589 res!640879) b!957592))

(assert (= (and b!957592 c!100172) b!957577))

(assert (= (and b!957592 (not c!100172)) b!957583))

(assert (= (and b!957577 res!640875) b!957580))

(assert (= (or b!957577 b!957583) bm!41741))

(assert (= (and b!957592 res!640876) b!957584))

(assert (= (and b!957584 c!100170) b!957595))

(assert (= (and b!957584 (not c!100170)) b!957588))

(assert (= (and b!957595 res!640872) b!957596))

(assert (= (or b!957595 b!957588) bm!41747))

(declare-fun b_lambda!14441 () Bool)

(assert (=> (not b_lambda!14441) (not b!957585)))

(declare-fun t!27841 () Bool)

(declare-fun tb!6205 () Bool)

(assert (=> (and start!82184 (= defaultEntry!1205 defaultEntry!1205) t!27841) tb!6205))

(declare-fun result!12363 () Bool)

(assert (=> tb!6205 (= result!12363 tp_is_empty!21055)))

(assert (=> b!957585 t!27841))

(declare-fun b_and!29941 () Bool)

(assert (= b_and!29935 (and (=> t!27841 result!12363) b_and!29941)))

(declare-fun m!889155 () Bool)

(assert (=> b!957586 m!889155))

(assert (=> b!957593 m!889083))

(assert (=> b!957593 m!889083))

(assert (=> b!957593 m!889087))

(declare-fun m!889157 () Bool)

(assert (=> b!957591 m!889157))

(declare-fun m!889159 () Bool)

(assert (=> b!957591 m!889159))

(declare-fun m!889161 () Bool)

(assert (=> b!957591 m!889161))

(declare-fun m!889163 () Bool)

(assert (=> b!957591 m!889163))

(assert (=> b!957591 m!889163))

(declare-fun m!889165 () Bool)

(assert (=> b!957591 m!889165))

(assert (=> b!957591 m!889083))

(declare-fun m!889167 () Bool)

(assert (=> b!957591 m!889167))

(declare-fun m!889169 () Bool)

(assert (=> b!957591 m!889169))

(declare-fun m!889171 () Bool)

(assert (=> b!957591 m!889171))

(assert (=> b!957591 m!889161))

(declare-fun m!889173 () Bool)

(assert (=> b!957591 m!889173))

(declare-fun m!889175 () Bool)

(assert (=> b!957591 m!889175))

(declare-fun m!889177 () Bool)

(assert (=> b!957591 m!889177))

(declare-fun m!889179 () Bool)

(assert (=> b!957591 m!889179))

(declare-fun m!889181 () Bool)

(assert (=> b!957591 m!889181))

(declare-fun m!889183 () Bool)

(assert (=> b!957591 m!889183))

(assert (=> b!957591 m!889169))

(declare-fun m!889185 () Bool)

(assert (=> b!957591 m!889185))

(declare-fun m!889187 () Bool)

(assert (=> b!957591 m!889187))

(assert (=> b!957591 m!889185))

(assert (=> bm!41745 m!889175))

(declare-fun m!889189 () Bool)

(assert (=> bm!41741 m!889189))

(assert (=> b!957579 m!889083))

(assert (=> b!957579 m!889083))

(assert (=> b!957579 m!889087))

(declare-fun m!889191 () Bool)

(assert (=> bm!41747 m!889191))

(declare-fun m!889193 () Bool)

(assert (=> b!957596 m!889193))

(declare-fun m!889195 () Bool)

(assert (=> b!957580 m!889195))

(declare-fun m!889197 () Bool)

(assert (=> bm!41743 m!889197))

(assert (=> b!957594 m!889083))

(assert (=> b!957594 m!889083))

(declare-fun m!889199 () Bool)

(assert (=> b!957594 m!889199))

(declare-fun m!889201 () Bool)

(assert (=> b!957585 m!889201))

(declare-fun m!889203 () Bool)

(assert (=> b!957585 m!889203))

(assert (=> b!957585 m!889201))

(declare-fun m!889205 () Bool)

(assert (=> b!957585 m!889205))

(assert (=> b!957585 m!889203))

(assert (=> b!957585 m!889083))

(assert (=> b!957585 m!889083))

(declare-fun m!889207 () Bool)

(assert (=> b!957585 m!889207))

(assert (=> d!116173 m!889071))

(assert (=> b!957437 d!116173))

(declare-fun d!116175 () Bool)

(assert (=> d!116175 (= (validKeyInArray!0 (select (arr!27999 _keys!1441) i!735)) (and (not (= (select (arr!27999 _keys!1441) i!735) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27999 _keys!1441) i!735) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!957436 d!116175))

(declare-fun b!957607 () Bool)

(declare-fun e!539706 () Bool)

(assert (=> b!957607 (= e!539706 tp_is_empty!21055)))

(declare-fun condMapEmpty!33553 () Bool)

(declare-fun mapDefault!33553 () ValueCell!10046)

(assert (=> mapNonEmpty!33544 (= condMapEmpty!33553 (= mapRest!33544 ((as const (Array (_ BitVec 32) ValueCell!10046)) mapDefault!33553)))))

(declare-fun mapRes!33553 () Bool)

(assert (=> mapNonEmpty!33544 (= tp!64125 (and e!539706 mapRes!33553))))

(declare-fun b!957606 () Bool)

(declare-fun e!539707 () Bool)

(assert (=> b!957606 (= e!539707 tp_is_empty!21055)))

(declare-fun mapNonEmpty!33553 () Bool)

(declare-fun tp!64141 () Bool)

(assert (=> mapNonEmpty!33553 (= mapRes!33553 (and tp!64141 e!539707))))

(declare-fun mapRest!33553 () (Array (_ BitVec 32) ValueCell!10046))

(declare-fun mapKey!33553 () (_ BitVec 32))

(declare-fun mapValue!33553 () ValueCell!10046)

(assert (=> mapNonEmpty!33553 (= mapRest!33544 (store mapRest!33553 mapKey!33553 mapValue!33553))))

(declare-fun mapIsEmpty!33553 () Bool)

(assert (=> mapIsEmpty!33553 mapRes!33553))

(assert (= (and mapNonEmpty!33544 condMapEmpty!33553) mapIsEmpty!33553))

(assert (= (and mapNonEmpty!33544 (not condMapEmpty!33553)) mapNonEmpty!33553))

(assert (= (and mapNonEmpty!33553 ((_ is ValueCellFull!10046) mapValue!33553)) b!957606))

(assert (= (and mapNonEmpty!33544 ((_ is ValueCellFull!10046) mapDefault!33553)) b!957607))

(declare-fun m!889209 () Bool)

(assert (=> mapNonEmpty!33553 m!889209))

(declare-fun b_lambda!14443 () Bool)

(assert (= b_lambda!14441 (or (and start!82184 b_free!18439) b_lambda!14443)))

(check-sat (not bm!41747) (not b!957521) (not b!957594) (not b!957591) (not b!957510) b_and!29941 (not bm!41743) (not b!957524) (not b!957579) (not b_next!18439) (not bm!41745) (not mapNonEmpty!33553) (not d!116171) (not b!957534) (not b!957522) tp_is_empty!21055 (not d!116173) (not b!957580) (not b!957509) (not bm!41726) (not b_lambda!14443) (not bm!41723) (not b!957596) (not bm!41741) (not b!957586) (not b!957593) (not b!957585) (not b!957532))
(check-sat b_and!29941 (not b_next!18439))
