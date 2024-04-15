; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36046 () Bool)

(assert start!36046)

(declare-fun mapNonEmpty!14163 () Bool)

(declare-fun mapRes!14163 () Bool)

(declare-fun tp!28239 () Bool)

(declare-fun e!221578 () Bool)

(assert (=> mapNonEmpty!14163 (= mapRes!14163 (and tp!28239 e!221578))))

(declare-datatypes ((V!12203 0))(
  ( (V!12204 (val!4254 Int)) )
))
(declare-datatypes ((ValueCell!3866 0))(
  ( (ValueCellFull!3866 (v!6443 V!12203)) (EmptyCell!3866) )
))
(declare-fun mapRest!14163 () (Array (_ BitVec 32) ValueCell!3866))

(declare-fun mapKey!14163 () (_ BitVec 32))

(declare-fun mapValue!14163 () ValueCell!3866)

(declare-datatypes ((array!20377 0))(
  ( (array!20378 (arr!9673 (Array (_ BitVec 32) ValueCell!3866)) (size!10026 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20377)

(assert (=> mapNonEmpty!14163 (= (arr!9673 _values!1277) (store mapRest!14163 mapKey!14163 mapValue!14163))))

(declare-fun b!361767 () Bool)

(declare-fun tp_is_empty!8419 () Bool)

(assert (=> b!361767 (= e!221578 tp_is_empty!8419)))

(declare-fun b!361768 () Bool)

(declare-fun res!201290 () Bool)

(declare-fun e!221576 () Bool)

(assert (=> b!361768 (=> (not res!201290) (not e!221576))))

(declare-datatypes ((array!20379 0))(
  ( (array!20380 (arr!9674 (Array (_ BitVec 32) (_ BitVec 64))) (size!10027 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20379)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!361768 (= res!201290 (and (= (size!10026 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10027 _keys!1541) (size!10026 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361769 () Bool)

(declare-fun res!201288 () Bool)

(assert (=> b!361769 (=> (not res!201288) (not e!221576))))

(declare-datatypes ((List!5488 0))(
  ( (Nil!5485) (Cons!5484 (h!6340 (_ BitVec 64)) (t!10629 List!5488)) )
))
(declare-fun arrayNoDuplicates!0 (array!20379 (_ BitVec 32) List!5488) Bool)

(assert (=> b!361769 (= res!201288 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5485))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun b!361770 () Bool)

(declare-fun arrayContainsKey!0 (array!20379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361770 (= e!221576 (not (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924))))))

(declare-fun b!361772 () Bool)

(declare-fun res!201289 () Bool)

(assert (=> b!361772 (=> (not res!201289) (not e!221576))))

(assert (=> b!361772 (= res!201289 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10027 _keys!1541))))))

(declare-fun b!361773 () Bool)

(declare-fun res!201292 () Bool)

(assert (=> b!361773 (=> (not res!201292) (not e!221576))))

(assert (=> b!361773 (= res!201292 (not (= (select (arr!9674 _keys!1541) from!1924) k0!1134)))))

(declare-fun b!361774 () Bool)

(declare-fun e!221577 () Bool)

(assert (=> b!361774 (= e!221577 tp_is_empty!8419)))

(declare-fun b!361775 () Bool)

(declare-fun res!201291 () Bool)

(assert (=> b!361775 (=> (not res!201291) (not e!221576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20379 (_ BitVec 32)) Bool)

(assert (=> b!361775 (= res!201291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapIsEmpty!14163 () Bool)

(assert (=> mapIsEmpty!14163 mapRes!14163))

(declare-fun b!361776 () Bool)

(declare-fun res!201293 () Bool)

(assert (=> b!361776 (=> (not res!201293) (not e!221576))))

(assert (=> b!361776 (= res!201293 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun res!201287 () Bool)

(assert (=> start!36046 (=> (not res!201287) (not e!221576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36046 (= res!201287 (validMask!0 mask!1943))))

(assert (=> start!36046 e!221576))

(assert (=> start!36046 true))

(declare-fun array_inv!7124 (array!20379) Bool)

(assert (=> start!36046 (array_inv!7124 _keys!1541)))

(declare-fun e!221575 () Bool)

(declare-fun array_inv!7125 (array!20377) Bool)

(assert (=> start!36046 (and (array_inv!7125 _values!1277) e!221575)))

(declare-fun b!361771 () Bool)

(assert (=> b!361771 (= e!221575 (and e!221577 mapRes!14163))))

(declare-fun condMapEmpty!14163 () Bool)

(declare-fun mapDefault!14163 () ValueCell!3866)

(assert (=> b!361771 (= condMapEmpty!14163 (= (arr!9673 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3866)) mapDefault!14163)))))

(assert (= (and start!36046 res!201287) b!361768))

(assert (= (and b!361768 res!201290) b!361775))

(assert (= (and b!361775 res!201291) b!361769))

(assert (= (and b!361769 res!201288) b!361772))

(assert (= (and b!361772 res!201289) b!361776))

(assert (= (and b!361776 res!201293) b!361773))

(assert (= (and b!361773 res!201292) b!361770))

(assert (= (and b!361771 condMapEmpty!14163) mapIsEmpty!14163))

(assert (= (and b!361771 (not condMapEmpty!14163)) mapNonEmpty!14163))

(get-info :version)

(assert (= (and mapNonEmpty!14163 ((_ is ValueCellFull!3866) mapValue!14163)) b!361767))

(assert (= (and b!361771 ((_ is ValueCellFull!3866) mapDefault!14163)) b!361774))

(assert (= start!36046 b!361771))

(declare-fun m!357889 () Bool)

(assert (=> mapNonEmpty!14163 m!357889))

(declare-fun m!357891 () Bool)

(assert (=> b!361775 m!357891))

(declare-fun m!357893 () Bool)

(assert (=> b!361773 m!357893))

(declare-fun m!357895 () Bool)

(assert (=> b!361769 m!357895))

(declare-fun m!357897 () Bool)

(assert (=> b!361770 m!357897))

(declare-fun m!357899 () Bool)

(assert (=> start!36046 m!357899))

(declare-fun m!357901 () Bool)

(assert (=> start!36046 m!357901))

(declare-fun m!357903 () Bool)

(assert (=> start!36046 m!357903))

(declare-fun m!357905 () Bool)

(assert (=> b!361776 m!357905))

(check-sat (not b!361770) (not b!361776) tp_is_empty!8419 (not start!36046) (not mapNonEmpty!14163) (not b!361775) (not b!361769))
(check-sat)
(get-model)

(declare-fun bm!27170 () Bool)

(declare-fun call!27173 () Bool)

(assert (=> bm!27170 (= call!27173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361845 () Bool)

(declare-fun e!221615 () Bool)

(assert (=> b!361845 (= e!221615 call!27173)))

(declare-fun b!361846 () Bool)

(declare-fun e!221617 () Bool)

(assert (=> b!361846 (= e!221617 call!27173)))

(declare-fun d!71779 () Bool)

(declare-fun res!201340 () Bool)

(declare-fun e!221616 () Bool)

(assert (=> d!71779 (=> res!201340 e!221616)))

(assert (=> d!71779 (= res!201340 (bvsge #b00000000000000000000000000000000 (size!10027 _keys!1541)))))

(assert (=> d!71779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221616)))

(declare-fun b!361847 () Bool)

(assert (=> b!361847 (= e!221616 e!221617)))

(declare-fun c!53675 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361847 (= c!53675 (validKeyInArray!0 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361848 () Bool)

(assert (=> b!361848 (= e!221617 e!221615)))

(declare-fun lt!166385 () (_ BitVec 64))

(assert (=> b!361848 (= lt!166385 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11100 0))(
  ( (Unit!11101) )
))
(declare-fun lt!166384 () Unit!11100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20379 (_ BitVec 64) (_ BitVec 32)) Unit!11100)

(assert (=> b!361848 (= lt!166384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166385 #b00000000000000000000000000000000))))

(assert (=> b!361848 (arrayContainsKey!0 _keys!1541 lt!166385 #b00000000000000000000000000000000)))

(declare-fun lt!166383 () Unit!11100)

(assert (=> b!361848 (= lt!166383 lt!166384)))

(declare-fun res!201341 () Bool)

(declare-datatypes ((SeekEntryResult!3494 0))(
  ( (MissingZero!3494 (index!16155 (_ BitVec 32))) (Found!3494 (index!16156 (_ BitVec 32))) (Intermediate!3494 (undefined!4306 Bool) (index!16157 (_ BitVec 32)) (x!36077 (_ BitVec 32))) (Undefined!3494) (MissingVacant!3494 (index!16158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20379 (_ BitVec 32)) SeekEntryResult!3494)

(assert (=> b!361848 (= res!201341 (= (seekEntryOrOpen!0 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3494 #b00000000000000000000000000000000)))))

(assert (=> b!361848 (=> (not res!201341) (not e!221615))))

(assert (= (and d!71779 (not res!201340)) b!361847))

(assert (= (and b!361847 c!53675) b!361848))

(assert (= (and b!361847 (not c!53675)) b!361846))

(assert (= (and b!361848 res!201341) b!361845))

(assert (= (or b!361845 b!361846) bm!27170))

(declare-fun m!357943 () Bool)

(assert (=> bm!27170 m!357943))

(declare-fun m!357945 () Bool)

(assert (=> b!361847 m!357945))

(assert (=> b!361847 m!357945))

(declare-fun m!357947 () Bool)

(assert (=> b!361847 m!357947))

(assert (=> b!361848 m!357945))

(declare-fun m!357949 () Bool)

(assert (=> b!361848 m!357949))

(declare-fun m!357951 () Bool)

(assert (=> b!361848 m!357951))

(assert (=> b!361848 m!357945))

(declare-fun m!357953 () Bool)

(assert (=> b!361848 m!357953))

(assert (=> b!361775 d!71779))

(declare-fun b!361859 () Bool)

(declare-fun e!221629 () Bool)

(declare-fun e!221626 () Bool)

(assert (=> b!361859 (= e!221629 e!221626)))

(declare-fun c!53678 () Bool)

(assert (=> b!361859 (= c!53678 (validKeyInArray!0 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361860 () Bool)

(declare-fun e!221628 () Bool)

(assert (=> b!361860 (= e!221628 e!221629)))

(declare-fun res!201349 () Bool)

(assert (=> b!361860 (=> (not res!201349) (not e!221629))))

(declare-fun e!221627 () Bool)

(assert (=> b!361860 (= res!201349 (not e!221627))))

(declare-fun res!201350 () Bool)

(assert (=> b!361860 (=> (not res!201350) (not e!221627))))

(assert (=> b!361860 (= res!201350 (validKeyInArray!0 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27173 () Bool)

(declare-fun call!27176 () Bool)

(assert (=> bm!27173 (= call!27176 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53678 (Cons!5484 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000) Nil!5485) Nil!5485)))))

(declare-fun b!361861 () Bool)

(assert (=> b!361861 (= e!221626 call!27176)))

(declare-fun d!71781 () Bool)

(declare-fun res!201348 () Bool)

(assert (=> d!71781 (=> res!201348 e!221628)))

(assert (=> d!71781 (= res!201348 (bvsge #b00000000000000000000000000000000 (size!10027 _keys!1541)))))

(assert (=> d!71781 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5485) e!221628)))

(declare-fun b!361862 () Bool)

(declare-fun contains!2419 (List!5488 (_ BitVec 64)) Bool)

(assert (=> b!361862 (= e!221627 (contains!2419 Nil!5485 (select (arr!9674 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361863 () Bool)

(assert (=> b!361863 (= e!221626 call!27176)))

(assert (= (and d!71781 (not res!201348)) b!361860))

(assert (= (and b!361860 res!201350) b!361862))

(assert (= (and b!361860 res!201349) b!361859))

(assert (= (and b!361859 c!53678) b!361861))

(assert (= (and b!361859 (not c!53678)) b!361863))

(assert (= (or b!361861 b!361863) bm!27173))

(assert (=> b!361859 m!357945))

(assert (=> b!361859 m!357945))

(assert (=> b!361859 m!357947))

(assert (=> b!361860 m!357945))

(assert (=> b!361860 m!357945))

(assert (=> b!361860 m!357947))

(assert (=> bm!27173 m!357945))

(declare-fun m!357955 () Bool)

(assert (=> bm!27173 m!357955))

(assert (=> b!361862 m!357945))

(assert (=> b!361862 m!357945))

(declare-fun m!357957 () Bool)

(assert (=> b!361862 m!357957))

(assert (=> b!361769 d!71781))

(declare-fun d!71783 () Bool)

(declare-fun res!201355 () Bool)

(declare-fun e!221634 () Bool)

(assert (=> d!71783 (=> res!201355 e!221634)))

(assert (=> d!71783 (= res!201355 (= (select (arr!9674 _keys!1541) (bvadd #b00000000000000000000000000000001 from!1924)) k0!1134))))

(assert (=> d!71783 (= (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924)) e!221634)))

(declare-fun b!361868 () Bool)

(declare-fun e!221635 () Bool)

(assert (=> b!361868 (= e!221634 e!221635)))

(declare-fun res!201356 () Bool)

(assert (=> b!361868 (=> (not res!201356) (not e!221635))))

(assert (=> b!361868 (= res!201356 (bvslt (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001) (size!10027 _keys!1541)))))

(declare-fun b!361869 () Bool)

(assert (=> b!361869 (= e!221635 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71783 (not res!201355)) b!361868))

(assert (= (and b!361868 res!201356) b!361869))

(declare-fun m!357959 () Bool)

(assert (=> d!71783 m!357959))

(declare-fun m!357961 () Bool)

(assert (=> b!361869 m!357961))

(assert (=> b!361770 d!71783))

(declare-fun d!71785 () Bool)

(declare-fun res!201357 () Bool)

(declare-fun e!221636 () Bool)

(assert (=> d!71785 (=> res!201357 e!221636)))

(assert (=> d!71785 (= res!201357 (= (select (arr!9674 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71785 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221636)))

(declare-fun b!361870 () Bool)

(declare-fun e!221637 () Bool)

(assert (=> b!361870 (= e!221636 e!221637)))

(declare-fun res!201358 () Bool)

(assert (=> b!361870 (=> (not res!201358) (not e!221637))))

(assert (=> b!361870 (= res!201358 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10027 _keys!1541)))))

(declare-fun b!361871 () Bool)

(assert (=> b!361871 (= e!221637 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71785 (not res!201357)) b!361870))

(assert (= (and b!361870 res!201358) b!361871))

(assert (=> d!71785 m!357893))

(declare-fun m!357963 () Bool)

(assert (=> b!361871 m!357963))

(assert (=> b!361776 d!71785))

(declare-fun d!71787 () Bool)

(assert (=> d!71787 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36046 d!71787))

(declare-fun d!71789 () Bool)

(assert (=> d!71789 (= (array_inv!7124 _keys!1541) (bvsge (size!10027 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36046 d!71789))

(declare-fun d!71791 () Bool)

(assert (=> d!71791 (= (array_inv!7125 _values!1277) (bvsge (size!10026 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36046 d!71791))

(declare-fun b!361878 () Bool)

(declare-fun e!221642 () Bool)

(assert (=> b!361878 (= e!221642 tp_is_empty!8419)))

(declare-fun condMapEmpty!14172 () Bool)

(declare-fun mapDefault!14172 () ValueCell!3866)

(assert (=> mapNonEmpty!14163 (= condMapEmpty!14172 (= mapRest!14163 ((as const (Array (_ BitVec 32) ValueCell!3866)) mapDefault!14172)))))

(declare-fun e!221643 () Bool)

(declare-fun mapRes!14172 () Bool)

(assert (=> mapNonEmpty!14163 (= tp!28239 (and e!221643 mapRes!14172))))

(declare-fun b!361879 () Bool)

(assert (=> b!361879 (= e!221643 tp_is_empty!8419)))

(declare-fun mapIsEmpty!14172 () Bool)

(assert (=> mapIsEmpty!14172 mapRes!14172))

(declare-fun mapNonEmpty!14172 () Bool)

(declare-fun tp!28248 () Bool)

(assert (=> mapNonEmpty!14172 (= mapRes!14172 (and tp!28248 e!221642))))

(declare-fun mapRest!14172 () (Array (_ BitVec 32) ValueCell!3866))

(declare-fun mapValue!14172 () ValueCell!3866)

(declare-fun mapKey!14172 () (_ BitVec 32))

(assert (=> mapNonEmpty!14172 (= mapRest!14163 (store mapRest!14172 mapKey!14172 mapValue!14172))))

(assert (= (and mapNonEmpty!14163 condMapEmpty!14172) mapIsEmpty!14172))

(assert (= (and mapNonEmpty!14163 (not condMapEmpty!14172)) mapNonEmpty!14172))

(assert (= (and mapNonEmpty!14172 ((_ is ValueCellFull!3866) mapValue!14172)) b!361878))

(assert (= (and mapNonEmpty!14163 ((_ is ValueCellFull!3866) mapDefault!14172)) b!361879))

(declare-fun m!357965 () Bool)

(assert (=> mapNonEmpty!14172 m!357965))

(check-sat (not b!361869) tp_is_empty!8419 (not b!361859) (not b!361848) (not b!361862) (not bm!27173) (not b!361847) (not b!361871) (not b!361860) (not mapNonEmpty!14172) (not bm!27170))
(check-sat)
