; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35288 () Bool)

(assert start!35288)

(declare-fun res!196061 () Bool)

(declare-fun e!216592 () Bool)

(assert (=> start!35288 (=> (not res!196061) (not e!216592))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35288 (= res!196061 (validMask!0 mask!1842))))

(assert (=> start!35288 e!216592))

(assert (=> start!35288 true))

(declare-datatypes ((V!11363 0))(
  ( (V!11364 (val!3939 Int)) )
))
(declare-datatypes ((ValueCell!3551 0))(
  ( (ValueCellFull!3551 (v!6133 V!11363)) (EmptyCell!3551) )
))
(declare-datatypes ((array!19154 0))(
  ( (array!19155 (arr!9073 (Array (_ BitVec 32) ValueCell!3551)) (size!9425 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19154)

(declare-fun e!216593 () Bool)

(declare-fun array_inv!6700 (array!19154) Bool)

(assert (=> start!35288 (and (array_inv!6700 _values!1208) e!216593)))

(declare-datatypes ((array!19156 0))(
  ( (array!19157 (arr!9074 (Array (_ BitVec 32) (_ BitVec 64))) (size!9426 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19156)

(declare-fun array_inv!6701 (array!19156) Bool)

(assert (=> start!35288 (array_inv!6701 _keys!1456)))

(declare-fun b!353610 () Bool)

(declare-fun res!196064 () Bool)

(assert (=> b!353610 (=> (not res!196064) (not e!216592))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353610 (= res!196064 (and (= (size!9425 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9426 _keys!1456) (size!9425 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353611 () Bool)

(declare-fun res!196062 () Bool)

(assert (=> b!353611 (=> (not res!196062) (not e!216592))))

(assert (=> b!353611 (= res!196062 (and (bvsle #b00000000000000000000000000000000 (size!9426 _keys!1456)) (bvslt (size!9426 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!13182 () Bool)

(declare-fun mapRes!13182 () Bool)

(declare-fun tp!27078 () Bool)

(declare-fun e!216595 () Bool)

(assert (=> mapNonEmpty!13182 (= mapRes!13182 (and tp!27078 e!216595))))

(declare-fun mapValue!13182 () ValueCell!3551)

(declare-fun mapRest!13182 () (Array (_ BitVec 32) ValueCell!3551))

(declare-fun mapKey!13182 () (_ BitVec 32))

(assert (=> mapNonEmpty!13182 (= (arr!9073 _values!1208) (store mapRest!13182 mapKey!13182 mapValue!13182))))

(declare-fun b!353612 () Bool)

(declare-fun res!196063 () Bool)

(assert (=> b!353612 (=> (not res!196063) (not e!216592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19156 (_ BitVec 32)) Bool)

(assert (=> b!353612 (= res!196063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13182 () Bool)

(assert (=> mapIsEmpty!13182 mapRes!13182))

(declare-fun b!353613 () Bool)

(declare-fun e!216596 () Bool)

(assert (=> b!353613 (= e!216593 (and e!216596 mapRes!13182))))

(declare-fun condMapEmpty!13182 () Bool)

(declare-fun mapDefault!13182 () ValueCell!3551)

(assert (=> b!353613 (= condMapEmpty!13182 (= (arr!9073 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3551)) mapDefault!13182)))))

(declare-fun b!353614 () Bool)

(declare-fun tp_is_empty!7789 () Bool)

(assert (=> b!353614 (= e!216596 tp_is_empty!7789)))

(declare-fun b!353615 () Bool)

(assert (=> b!353615 (= e!216595 tp_is_empty!7789)))

(declare-fun b!353616 () Bool)

(declare-datatypes ((List!5182 0))(
  ( (Nil!5179) (Cons!5178 (h!6034 (_ BitVec 64)) (t!10324 List!5182)) )
))
(declare-fun noDuplicate!180 (List!5182) Bool)

(assert (=> b!353616 (= e!216592 (not (noDuplicate!180 Nil!5179)))))

(assert (= (and start!35288 res!196061) b!353610))

(assert (= (and b!353610 res!196064) b!353612))

(assert (= (and b!353612 res!196063) b!353611))

(assert (= (and b!353611 res!196062) b!353616))

(assert (= (and b!353613 condMapEmpty!13182) mapIsEmpty!13182))

(assert (= (and b!353613 (not condMapEmpty!13182)) mapNonEmpty!13182))

(get-info :version)

(assert (= (and mapNonEmpty!13182 ((_ is ValueCellFull!3551) mapValue!13182)) b!353615))

(assert (= (and b!353613 ((_ is ValueCellFull!3551) mapDefault!13182)) b!353614))

(assert (= start!35288 b!353613))

(declare-fun m!353177 () Bool)

(assert (=> start!35288 m!353177))

(declare-fun m!353179 () Bool)

(assert (=> start!35288 m!353179))

(declare-fun m!353181 () Bool)

(assert (=> start!35288 m!353181))

(declare-fun m!353183 () Bool)

(assert (=> mapNonEmpty!13182 m!353183))

(declare-fun m!353185 () Bool)

(assert (=> b!353612 m!353185))

(declare-fun m!353187 () Bool)

(assert (=> b!353616 m!353187))

(check-sat tp_is_empty!7789 (not start!35288) (not b!353616) (not mapNonEmpty!13182) (not b!353612))
(check-sat)
(get-model)

(declare-fun d!71669 () Bool)

(declare-fun res!196093 () Bool)

(declare-fun e!216631 () Bool)

(assert (=> d!71669 (=> res!196093 e!216631)))

(assert (=> d!71669 (= res!196093 ((_ is Nil!5179) Nil!5179))))

(assert (=> d!71669 (= (noDuplicate!180 Nil!5179) e!216631)))

(declare-fun b!353663 () Bool)

(declare-fun e!216632 () Bool)

(assert (=> b!353663 (= e!216631 e!216632)))

(declare-fun res!196094 () Bool)

(assert (=> b!353663 (=> (not res!196094) (not e!216632))))

(declare-fun contains!2354 (List!5182 (_ BitVec 64)) Bool)

(assert (=> b!353663 (= res!196094 (not (contains!2354 (t!10324 Nil!5179) (h!6034 Nil!5179))))))

(declare-fun b!353664 () Bool)

(assert (=> b!353664 (= e!216632 (noDuplicate!180 (t!10324 Nil!5179)))))

(assert (= (and d!71669 (not res!196093)) b!353663))

(assert (= (and b!353663 res!196094) b!353664))

(declare-fun m!353213 () Bool)

(assert (=> b!353663 m!353213))

(declare-fun m!353215 () Bool)

(assert (=> b!353664 m!353215))

(assert (=> b!353616 d!71669))

(declare-fun b!353673 () Bool)

(declare-fun e!216640 () Bool)

(declare-fun e!216641 () Bool)

(assert (=> b!353673 (= e!216640 e!216641)))

(declare-fun lt!165618 () (_ BitVec 64))

(assert (=> b!353673 (= lt!165618 (select (arr!9074 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10899 0))(
  ( (Unit!10900) )
))
(declare-fun lt!165619 () Unit!10899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19156 (_ BitVec 64) (_ BitVec 32)) Unit!10899)

(assert (=> b!353673 (= lt!165619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165618 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353673 (arrayContainsKey!0 _keys!1456 lt!165618 #b00000000000000000000000000000000)))

(declare-fun lt!165617 () Unit!10899)

(assert (=> b!353673 (= lt!165617 lt!165619)))

(declare-fun res!196100 () Bool)

(declare-datatypes ((SeekEntryResult!3437 0))(
  ( (MissingZero!3437 (index!15927 (_ BitVec 32))) (Found!3437 (index!15928 (_ BitVec 32))) (Intermediate!3437 (undefined!4249 Bool) (index!15929 (_ BitVec 32)) (x!35158 (_ BitVec 32))) (Undefined!3437) (MissingVacant!3437 (index!15930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19156 (_ BitVec 32)) SeekEntryResult!3437)

(assert (=> b!353673 (= res!196100 (= (seekEntryOrOpen!0 (select (arr!9074 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3437 #b00000000000000000000000000000000)))))

(assert (=> b!353673 (=> (not res!196100) (not e!216641))))

(declare-fun b!353674 () Bool)

(declare-fun e!216639 () Bool)

(assert (=> b!353674 (= e!216639 e!216640)))

(declare-fun c!53675 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353674 (= c!53675 (validKeyInArray!0 (select (arr!9074 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353675 () Bool)

(declare-fun call!27137 () Bool)

(assert (=> b!353675 (= e!216640 call!27137)))

(declare-fun bm!27134 () Bool)

(assert (=> bm!27134 (= call!27137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353676 () Bool)

(assert (=> b!353676 (= e!216641 call!27137)))

(declare-fun d!71671 () Bool)

(declare-fun res!196099 () Bool)

(assert (=> d!71671 (=> res!196099 e!216639)))

(assert (=> d!71671 (= res!196099 (bvsge #b00000000000000000000000000000000 (size!9426 _keys!1456)))))

(assert (=> d!71671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216639)))

(assert (= (and d!71671 (not res!196099)) b!353674))

(assert (= (and b!353674 c!53675) b!353673))

(assert (= (and b!353674 (not c!53675)) b!353675))

(assert (= (and b!353673 res!196100) b!353676))

(assert (= (or b!353676 b!353675) bm!27134))

(declare-fun m!353217 () Bool)

(assert (=> b!353673 m!353217))

(declare-fun m!353219 () Bool)

(assert (=> b!353673 m!353219))

(declare-fun m!353221 () Bool)

(assert (=> b!353673 m!353221))

(assert (=> b!353673 m!353217))

(declare-fun m!353223 () Bool)

(assert (=> b!353673 m!353223))

(assert (=> b!353674 m!353217))

(assert (=> b!353674 m!353217))

(declare-fun m!353225 () Bool)

(assert (=> b!353674 m!353225))

(declare-fun m!353227 () Bool)

(assert (=> bm!27134 m!353227))

(assert (=> b!353612 d!71671))

(declare-fun d!71673 () Bool)

(assert (=> d!71673 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35288 d!71673))

(declare-fun d!71675 () Bool)

(assert (=> d!71675 (= (array_inv!6700 _values!1208) (bvsge (size!9425 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35288 d!71675))

(declare-fun d!71677 () Bool)

(assert (=> d!71677 (= (array_inv!6701 _keys!1456) (bvsge (size!9426 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35288 d!71677))

(declare-fun mapNonEmpty!13191 () Bool)

(declare-fun mapRes!13191 () Bool)

(declare-fun tp!27087 () Bool)

(declare-fun e!216647 () Bool)

(assert (=> mapNonEmpty!13191 (= mapRes!13191 (and tp!27087 e!216647))))

(declare-fun mapRest!13191 () (Array (_ BitVec 32) ValueCell!3551))

(declare-fun mapKey!13191 () (_ BitVec 32))

(declare-fun mapValue!13191 () ValueCell!3551)

(assert (=> mapNonEmpty!13191 (= mapRest!13182 (store mapRest!13191 mapKey!13191 mapValue!13191))))

(declare-fun b!353683 () Bool)

(assert (=> b!353683 (= e!216647 tp_is_empty!7789)))

(declare-fun condMapEmpty!13191 () Bool)

(declare-fun mapDefault!13191 () ValueCell!3551)

(assert (=> mapNonEmpty!13182 (= condMapEmpty!13191 (= mapRest!13182 ((as const (Array (_ BitVec 32) ValueCell!3551)) mapDefault!13191)))))

(declare-fun e!216646 () Bool)

(assert (=> mapNonEmpty!13182 (= tp!27078 (and e!216646 mapRes!13191))))

(declare-fun b!353684 () Bool)

(assert (=> b!353684 (= e!216646 tp_is_empty!7789)))

(declare-fun mapIsEmpty!13191 () Bool)

(assert (=> mapIsEmpty!13191 mapRes!13191))

(assert (= (and mapNonEmpty!13182 condMapEmpty!13191) mapIsEmpty!13191))

(assert (= (and mapNonEmpty!13182 (not condMapEmpty!13191)) mapNonEmpty!13191))

(assert (= (and mapNonEmpty!13191 ((_ is ValueCellFull!3551) mapValue!13191)) b!353683))

(assert (= (and mapNonEmpty!13182 ((_ is ValueCellFull!3551) mapDefault!13191)) b!353684))

(declare-fun m!353229 () Bool)

(assert (=> mapNonEmpty!13191 m!353229))

(check-sat tp_is_empty!7789 (not bm!27134) (not mapNonEmpty!13191) (not b!353674) (not b!353664) (not b!353673) (not b!353663))
(check-sat)
