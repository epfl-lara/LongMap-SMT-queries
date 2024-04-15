; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36022 () Bool)

(assert start!36022)

(declare-fun b!361589 () Bool)

(declare-fun res!201188 () Bool)

(declare-fun e!221454 () Bool)

(assert (=> b!361589 (=> (not res!201188) (not e!221454))))

(declare-datatypes ((array!20351 0))(
  ( (array!20352 (arr!9661 (Array (_ BitVec 32) (_ BitVec 64))) (size!10014 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20351)

(declare-datatypes ((List!5485 0))(
  ( (Nil!5482) (Cons!5481 (h!6337 (_ BitVec 64)) (t!10626 List!5485)) )
))
(declare-fun arrayNoDuplicates!0 (array!20351 (_ BitVec 32) List!5485) Bool)

(assert (=> b!361589 (= res!201188 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5482))))

(declare-fun b!361590 () Bool)

(declare-fun e!221451 () Bool)

(declare-fun tp_is_empty!8407 () Bool)

(assert (=> b!361590 (= e!221451 tp_is_empty!8407)))

(declare-fun res!201185 () Bool)

(assert (=> start!36022 (=> (not res!201185) (not e!221454))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36022 (= res!201185 (validMask!0 mask!1943))))

(assert (=> start!36022 e!221454))

(assert (=> start!36022 true))

(declare-fun array_inv!7116 (array!20351) Bool)

(assert (=> start!36022 (array_inv!7116 _keys!1541)))

(declare-datatypes ((V!12187 0))(
  ( (V!12188 (val!4248 Int)) )
))
(declare-datatypes ((ValueCell!3860 0))(
  ( (ValueCellFull!3860 (v!6437 V!12187)) (EmptyCell!3860) )
))
(declare-datatypes ((array!20353 0))(
  ( (array!20354 (arr!9662 (Array (_ BitVec 32) ValueCell!3860)) (size!10015 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20353)

(declare-fun e!221455 () Bool)

(declare-fun array_inv!7117 (array!20353) Bool)

(assert (=> start!36022 (and (array_inv!7117 _values!1277) e!221455)))

(declare-fun b!361591 () Bool)

(declare-fun res!201186 () Bool)

(assert (=> b!361591 (=> (not res!201186) (not e!221454))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361591 (= res!201186 (and (= (size!10015 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10014 _keys!1541) (size!10015 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun b!361592 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(assert (=> b!361592 (= e!221454 (and (not (= (select (arr!9661 _keys!1541) from!1924) k0!1134)) (bvsge (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) (size!10014 _keys!1541)) (bvsge (size!10014 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361593 () Bool)

(declare-fun res!201184 () Bool)

(assert (=> b!361593 (=> (not res!201184) (not e!221454))))

(assert (=> b!361593 (= res!201184 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10014 _keys!1541))))))

(declare-fun mapIsEmpty!14142 () Bool)

(declare-fun mapRes!14142 () Bool)

(assert (=> mapIsEmpty!14142 mapRes!14142))

(declare-fun b!361594 () Bool)

(declare-fun e!221453 () Bool)

(assert (=> b!361594 (= e!221455 (and e!221453 mapRes!14142))))

(declare-fun condMapEmpty!14142 () Bool)

(declare-fun mapDefault!14142 () ValueCell!3860)

(assert (=> b!361594 (= condMapEmpty!14142 (= (arr!9662 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3860)) mapDefault!14142)))))

(declare-fun b!361595 () Bool)

(declare-fun res!201187 () Bool)

(assert (=> b!361595 (=> (not res!201187) (not e!221454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20351 (_ BitVec 32)) Bool)

(assert (=> b!361595 (= res!201187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361596 () Bool)

(assert (=> b!361596 (= e!221453 tp_is_empty!8407)))

(declare-fun mapNonEmpty!14142 () Bool)

(declare-fun tp!28218 () Bool)

(assert (=> mapNonEmpty!14142 (= mapRes!14142 (and tp!28218 e!221451))))

(declare-fun mapRest!14142 () (Array (_ BitVec 32) ValueCell!3860))

(declare-fun mapKey!14142 () (_ BitVec 32))

(declare-fun mapValue!14142 () ValueCell!3860)

(assert (=> mapNonEmpty!14142 (= (arr!9662 _values!1277) (store mapRest!14142 mapKey!14142 mapValue!14142))))

(declare-fun b!361597 () Bool)

(declare-fun res!201183 () Bool)

(assert (=> b!361597 (=> (not res!201183) (not e!221454))))

(declare-fun arrayContainsKey!0 (array!20351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361597 (= res!201183 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(assert (= (and start!36022 res!201185) b!361591))

(assert (= (and b!361591 res!201186) b!361595))

(assert (= (and b!361595 res!201187) b!361589))

(assert (= (and b!361589 res!201188) b!361593))

(assert (= (and b!361593 res!201184) b!361597))

(assert (= (and b!361597 res!201183) b!361592))

(assert (= (and b!361594 condMapEmpty!14142) mapIsEmpty!14142))

(assert (= (and b!361594 (not condMapEmpty!14142)) mapNonEmpty!14142))

(get-info :version)

(assert (= (and mapNonEmpty!14142 ((_ is ValueCellFull!3860) mapValue!14142)) b!361590))

(assert (= (and b!361594 ((_ is ValueCellFull!3860) mapDefault!14142)) b!361596))

(assert (= start!36022 b!361594))

(declare-fun m!357785 () Bool)

(assert (=> b!361597 m!357785))

(declare-fun m!357787 () Bool)

(assert (=> b!361592 m!357787))

(declare-fun m!357789 () Bool)

(assert (=> b!361589 m!357789))

(declare-fun m!357791 () Bool)

(assert (=> mapNonEmpty!14142 m!357791))

(declare-fun m!357793 () Bool)

(assert (=> b!361595 m!357793))

(declare-fun m!357795 () Bool)

(assert (=> start!36022 m!357795))

(declare-fun m!357797 () Bool)

(assert (=> start!36022 m!357797))

(declare-fun m!357799 () Bool)

(assert (=> start!36022 m!357799))

(check-sat tp_is_empty!8407 (not b!361589) (not b!361595) (not mapNonEmpty!14142) (not b!361597) (not start!36022))
(check-sat)
(get-model)

(declare-fun b!361660 () Bool)

(declare-fun e!221494 () Bool)

(declare-fun e!221492 () Bool)

(assert (=> b!361660 (= e!221494 e!221492)))

(declare-fun lt!166365 () (_ BitVec 64))

(assert (=> b!361660 (= lt!166365 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11098 0))(
  ( (Unit!11099) )
))
(declare-fun lt!166367 () Unit!11098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20351 (_ BitVec 64) (_ BitVec 32)) Unit!11098)

(assert (=> b!361660 (= lt!166367 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166365 #b00000000000000000000000000000000))))

(assert (=> b!361660 (arrayContainsKey!0 _keys!1541 lt!166365 #b00000000000000000000000000000000)))

(declare-fun lt!166366 () Unit!11098)

(assert (=> b!361660 (= lt!166366 lt!166367)))

(declare-fun res!201230 () Bool)

(declare-datatypes ((SeekEntryResult!3493 0))(
  ( (MissingZero!3493 (index!16151 (_ BitVec 32))) (Found!3493 (index!16152 (_ BitVec 32))) (Intermediate!3493 (undefined!4305 Bool) (index!16153 (_ BitVec 32)) (x!36058 (_ BitVec 32))) (Undefined!3493) (MissingVacant!3493 (index!16154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20351 (_ BitVec 32)) SeekEntryResult!3493)

(assert (=> b!361660 (= res!201230 (= (seekEntryOrOpen!0 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3493 #b00000000000000000000000000000000)))))

(assert (=> b!361660 (=> (not res!201230) (not e!221492))))

(declare-fun d!71763 () Bool)

(declare-fun res!201229 () Bool)

(declare-fun e!221493 () Bool)

(assert (=> d!71763 (=> res!201229 e!221493)))

(assert (=> d!71763 (= res!201229 (bvsge #b00000000000000000000000000000000 (size!10014 _keys!1541)))))

(assert (=> d!71763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221493)))

(declare-fun bm!27164 () Bool)

(declare-fun call!27167 () Bool)

(assert (=> bm!27164 (= call!27167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361661 () Bool)

(assert (=> b!361661 (= e!221493 e!221494)))

(declare-fun c!53669 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361661 (= c!53669 (validKeyInArray!0 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361662 () Bool)

(assert (=> b!361662 (= e!221494 call!27167)))

(declare-fun b!361663 () Bool)

(assert (=> b!361663 (= e!221492 call!27167)))

(assert (= (and d!71763 (not res!201229)) b!361661))

(assert (= (and b!361661 c!53669) b!361660))

(assert (= (and b!361661 (not c!53669)) b!361662))

(assert (= (and b!361660 res!201230) b!361663))

(assert (= (or b!361663 b!361662) bm!27164))

(declare-fun m!357833 () Bool)

(assert (=> b!361660 m!357833))

(declare-fun m!357835 () Bool)

(assert (=> b!361660 m!357835))

(declare-fun m!357837 () Bool)

(assert (=> b!361660 m!357837))

(assert (=> b!361660 m!357833))

(declare-fun m!357839 () Bool)

(assert (=> b!361660 m!357839))

(declare-fun m!357841 () Bool)

(assert (=> bm!27164 m!357841))

(assert (=> b!361661 m!357833))

(assert (=> b!361661 m!357833))

(declare-fun m!357843 () Bool)

(assert (=> b!361661 m!357843))

(assert (=> b!361595 d!71763))

(declare-fun b!361674 () Bool)

(declare-fun e!221505 () Bool)

(declare-fun call!27170 () Bool)

(assert (=> b!361674 (= e!221505 call!27170)))

(declare-fun bm!27167 () Bool)

(declare-fun c!53672 () Bool)

(assert (=> bm!27167 (= call!27170 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53672 (Cons!5481 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000) Nil!5482) Nil!5482)))))

(declare-fun b!361675 () Bool)

(declare-fun e!221503 () Bool)

(declare-fun e!221504 () Bool)

(assert (=> b!361675 (= e!221503 e!221504)))

(declare-fun res!201239 () Bool)

(assert (=> b!361675 (=> (not res!201239) (not e!221504))))

(declare-fun e!221506 () Bool)

(assert (=> b!361675 (= res!201239 (not e!221506))))

(declare-fun res!201238 () Bool)

(assert (=> b!361675 (=> (not res!201238) (not e!221506))))

(assert (=> b!361675 (= res!201238 (validKeyInArray!0 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71765 () Bool)

(declare-fun res!201237 () Bool)

(assert (=> d!71765 (=> res!201237 e!221503)))

(assert (=> d!71765 (= res!201237 (bvsge #b00000000000000000000000000000000 (size!10014 _keys!1541)))))

(assert (=> d!71765 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5482) e!221503)))

(declare-fun b!361676 () Bool)

(declare-fun contains!2418 (List!5485 (_ BitVec 64)) Bool)

(assert (=> b!361676 (= e!221506 (contains!2418 Nil!5482 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361677 () Bool)

(assert (=> b!361677 (= e!221504 e!221505)))

(assert (=> b!361677 (= c!53672 (validKeyInArray!0 (select (arr!9661 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361678 () Bool)

(assert (=> b!361678 (= e!221505 call!27170)))

(assert (= (and d!71765 (not res!201237)) b!361675))

(assert (= (and b!361675 res!201238) b!361676))

(assert (= (and b!361675 res!201239) b!361677))

(assert (= (and b!361677 c!53672) b!361678))

(assert (= (and b!361677 (not c!53672)) b!361674))

(assert (= (or b!361678 b!361674) bm!27167))

(assert (=> bm!27167 m!357833))

(declare-fun m!357845 () Bool)

(assert (=> bm!27167 m!357845))

(assert (=> b!361675 m!357833))

(assert (=> b!361675 m!357833))

(assert (=> b!361675 m!357843))

(assert (=> b!361676 m!357833))

(assert (=> b!361676 m!357833))

(declare-fun m!357847 () Bool)

(assert (=> b!361676 m!357847))

(assert (=> b!361677 m!357833))

(assert (=> b!361677 m!357833))

(assert (=> b!361677 m!357843))

(assert (=> b!361589 d!71765))

(declare-fun d!71767 () Bool)

(assert (=> d!71767 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36022 d!71767))

(declare-fun d!71769 () Bool)

(assert (=> d!71769 (= (array_inv!7116 _keys!1541) (bvsge (size!10014 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36022 d!71769))

(declare-fun d!71771 () Bool)

(assert (=> d!71771 (= (array_inv!7117 _values!1277) (bvsge (size!10015 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36022 d!71771))

(declare-fun d!71773 () Bool)

(declare-fun res!201244 () Bool)

(declare-fun e!221511 () Bool)

(assert (=> d!71773 (=> res!201244 e!221511)))

(assert (=> d!71773 (= res!201244 (= (select (arr!9661 _keys!1541) from!1924) k0!1134))))

(assert (=> d!71773 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221511)))

(declare-fun b!361683 () Bool)

(declare-fun e!221512 () Bool)

(assert (=> b!361683 (= e!221511 e!221512)))

(declare-fun res!201245 () Bool)

(assert (=> b!361683 (=> (not res!201245) (not e!221512))))

(assert (=> b!361683 (= res!201245 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10014 _keys!1541)))))

(declare-fun b!361684 () Bool)

(assert (=> b!361684 (= e!221512 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!71773 (not res!201244)) b!361683))

(assert (= (and b!361683 res!201245) b!361684))

(assert (=> d!71773 m!357787))

(declare-fun m!357849 () Bool)

(assert (=> b!361684 m!357849))

(assert (=> b!361597 d!71773))

(declare-fun mapIsEmpty!14151 () Bool)

(declare-fun mapRes!14151 () Bool)

(assert (=> mapIsEmpty!14151 mapRes!14151))

(declare-fun mapNonEmpty!14151 () Bool)

(declare-fun tp!28227 () Bool)

(declare-fun e!221517 () Bool)

(assert (=> mapNonEmpty!14151 (= mapRes!14151 (and tp!28227 e!221517))))

(declare-fun mapValue!14151 () ValueCell!3860)

(declare-fun mapKey!14151 () (_ BitVec 32))

(declare-fun mapRest!14151 () (Array (_ BitVec 32) ValueCell!3860))

(assert (=> mapNonEmpty!14151 (= mapRest!14142 (store mapRest!14151 mapKey!14151 mapValue!14151))))

(declare-fun condMapEmpty!14151 () Bool)

(declare-fun mapDefault!14151 () ValueCell!3860)

(assert (=> mapNonEmpty!14142 (= condMapEmpty!14151 (= mapRest!14142 ((as const (Array (_ BitVec 32) ValueCell!3860)) mapDefault!14151)))))

(declare-fun e!221518 () Bool)

(assert (=> mapNonEmpty!14142 (= tp!28218 (and e!221518 mapRes!14151))))

(declare-fun b!361692 () Bool)

(assert (=> b!361692 (= e!221518 tp_is_empty!8407)))

(declare-fun b!361691 () Bool)

(assert (=> b!361691 (= e!221517 tp_is_empty!8407)))

(assert (= (and mapNonEmpty!14142 condMapEmpty!14151) mapIsEmpty!14151))

(assert (= (and mapNonEmpty!14142 (not condMapEmpty!14151)) mapNonEmpty!14151))

(assert (= (and mapNonEmpty!14151 ((_ is ValueCellFull!3860) mapValue!14151)) b!361691))

(assert (= (and mapNonEmpty!14142 ((_ is ValueCellFull!3860) mapDefault!14151)) b!361692))

(declare-fun m!357851 () Bool)

(assert (=> mapNonEmpty!14151 m!357851))

(check-sat tp_is_empty!8407 (not b!361660) (not b!361661) (not b!361676) (not mapNonEmpty!14151) (not b!361675) (not b!361677) (not b!361684) (not bm!27164) (not bm!27167))
(check-sat)
