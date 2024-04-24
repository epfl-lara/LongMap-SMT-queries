; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93850 () Bool)

(assert start!93850)

(declare-fun b!1060575 () Bool)

(declare-fun res!708140 () Bool)

(declare-fun e!603687 () Bool)

(assert (=> b!1060575 (=> (not res!708140) (not e!603687))))

(declare-datatypes ((array!66937 0))(
  ( (array!66938 (arr!32173 (Array (_ BitVec 32) (_ BitVec 64))) (size!32710 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66937)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66937 (_ BitVec 32)) Bool)

(assert (=> b!1060575 (= res!708140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39058 () Bool)

(declare-fun mapRes!39058 () Bool)

(declare-fun tp!74864 () Bool)

(declare-fun e!603686 () Bool)

(assert (=> mapNonEmpty!39058 (= mapRes!39058 (and tp!74864 e!603686))))

(declare-datatypes ((V!38377 0))(
  ( (V!38378 (val!12516 Int)) )
))
(declare-datatypes ((ValueCell!11762 0))(
  ( (ValueCellFull!11762 (v!15121 V!38377)) (EmptyCell!11762) )
))
(declare-fun mapRest!39058 () (Array (_ BitVec 32) ValueCell!11762))

(declare-fun mapKey!39058 () (_ BitVec 32))

(declare-datatypes ((array!66939 0))(
  ( (array!66940 (arr!32174 (Array (_ BitVec 32) ValueCell!11762)) (size!32711 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66939)

(declare-fun mapValue!39058 () ValueCell!11762)

(assert (=> mapNonEmpty!39058 (= (arr!32174 _values!955) (store mapRest!39058 mapKey!39058 mapValue!39058))))

(declare-fun b!1060576 () Bool)

(declare-fun e!603683 () Bool)

(assert (=> b!1060576 (= e!603687 e!603683)))

(declare-fun res!708139 () Bool)

(assert (=> b!1060576 (=> res!708139 e!603683)))

(declare-datatypes ((List!22411 0))(
  ( (Nil!22408) (Cons!22407 (h!23625 (_ BitVec 64)) (t!31710 List!22411)) )
))
(declare-fun contains!6237 (List!22411 (_ BitVec 64)) Bool)

(assert (=> b!1060576 (= res!708139 (contains!6237 Nil!22408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1060577 () Bool)

(declare-fun res!708137 () Bool)

(assert (=> b!1060577 (=> (not res!708137) (not e!603687))))

(declare-fun noDuplicate!1586 (List!22411) Bool)

(assert (=> b!1060577 (= res!708137 (noDuplicate!1586 Nil!22408))))

(declare-fun b!1060578 () Bool)

(declare-fun e!603684 () Bool)

(declare-fun tp_is_empty!24931 () Bool)

(assert (=> b!1060578 (= e!603684 tp_is_empty!24931)))

(declare-fun b!1060579 () Bool)

(declare-fun res!708138 () Bool)

(assert (=> b!1060579 (=> (not res!708138) (not e!603687))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060579 (= res!708138 (and (= (size!32711 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32710 _keys!1163) (size!32711 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060581 () Bool)

(declare-fun res!708136 () Bool)

(assert (=> b!1060581 (=> (not res!708136) (not e!603687))))

(assert (=> b!1060581 (= res!708136 (and (bvsle #b00000000000000000000000000000000 (size!32710 _keys!1163)) (bvslt (size!32710 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1060582 () Bool)

(assert (=> b!1060582 (= e!603686 tp_is_empty!24931)))

(declare-fun res!708135 () Bool)

(assert (=> start!93850 (=> (not res!708135) (not e!603687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93850 (= res!708135 (validMask!0 mask!1515))))

(assert (=> start!93850 e!603687))

(assert (=> start!93850 true))

(declare-fun e!603688 () Bool)

(declare-fun array_inv!24946 (array!66939) Bool)

(assert (=> start!93850 (and (array_inv!24946 _values!955) e!603688)))

(declare-fun array_inv!24947 (array!66937) Bool)

(assert (=> start!93850 (array_inv!24947 _keys!1163)))

(declare-fun b!1060580 () Bool)

(assert (=> b!1060580 (= e!603688 (and e!603684 mapRes!39058))))

(declare-fun condMapEmpty!39058 () Bool)

(declare-fun mapDefault!39058 () ValueCell!11762)

(assert (=> b!1060580 (= condMapEmpty!39058 (= (arr!32174 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11762)) mapDefault!39058)))))

(declare-fun b!1060583 () Bool)

(assert (=> b!1060583 (= e!603683 (contains!6237 Nil!22408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39058 () Bool)

(assert (=> mapIsEmpty!39058 mapRes!39058))

(assert (= (and start!93850 res!708135) b!1060579))

(assert (= (and b!1060579 res!708138) b!1060575))

(assert (= (and b!1060575 res!708140) b!1060581))

(assert (= (and b!1060581 res!708136) b!1060577))

(assert (= (and b!1060577 res!708137) b!1060576))

(assert (= (and b!1060576 (not res!708139)) b!1060583))

(assert (= (and b!1060580 condMapEmpty!39058) mapIsEmpty!39058))

(assert (= (and b!1060580 (not condMapEmpty!39058)) mapNonEmpty!39058))

(get-info :version)

(assert (= (and mapNonEmpty!39058 ((_ is ValueCellFull!11762) mapValue!39058)) b!1060582))

(assert (= (and b!1060580 ((_ is ValueCellFull!11762) mapDefault!39058)) b!1060578))

(assert (= start!93850 b!1060580))

(declare-fun m!980407 () Bool)

(assert (=> b!1060583 m!980407))

(declare-fun m!980409 () Bool)

(assert (=> mapNonEmpty!39058 m!980409))

(declare-fun m!980411 () Bool)

(assert (=> b!1060575 m!980411))

(declare-fun m!980413 () Bool)

(assert (=> start!93850 m!980413))

(declare-fun m!980415 () Bool)

(assert (=> start!93850 m!980415))

(declare-fun m!980417 () Bool)

(assert (=> start!93850 m!980417))

(declare-fun m!980419 () Bool)

(assert (=> b!1060577 m!980419))

(declare-fun m!980421 () Bool)

(assert (=> b!1060576 m!980421))

(check-sat (not start!93850) tp_is_empty!24931 (not b!1060577) (not b!1060576) (not mapNonEmpty!39058) (not b!1060583) (not b!1060575))
(check-sat)
(get-model)

(declare-fun d!129179 () Bool)

(declare-fun res!708181 () Bool)

(declare-fun e!603729 () Bool)

(assert (=> d!129179 (=> res!708181 e!603729)))

(assert (=> d!129179 (= res!708181 ((_ is Nil!22408) Nil!22408))))

(assert (=> d!129179 (= (noDuplicate!1586 Nil!22408) e!603729)))

(declare-fun b!1060642 () Bool)

(declare-fun e!603730 () Bool)

(assert (=> b!1060642 (= e!603729 e!603730)))

(declare-fun res!708182 () Bool)

(assert (=> b!1060642 (=> (not res!708182) (not e!603730))))

(assert (=> b!1060642 (= res!708182 (not (contains!6237 (t!31710 Nil!22408) (h!23625 Nil!22408))))))

(declare-fun b!1060643 () Bool)

(assert (=> b!1060643 (= e!603730 (noDuplicate!1586 (t!31710 Nil!22408)))))

(assert (= (and d!129179 (not res!708181)) b!1060642))

(assert (= (and b!1060642 res!708182) b!1060643))

(declare-fun m!980455 () Bool)

(assert (=> b!1060642 m!980455))

(declare-fun m!980457 () Bool)

(assert (=> b!1060643 m!980457))

(assert (=> b!1060577 d!129179))

(declare-fun d!129181 () Bool)

(declare-fun lt!467612 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!537 (List!22411) (InoxSet (_ BitVec 64)))

(assert (=> d!129181 (= lt!467612 (select (content!537 Nil!22408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!603736 () Bool)

(assert (=> d!129181 (= lt!467612 e!603736)))

(declare-fun res!708188 () Bool)

(assert (=> d!129181 (=> (not res!708188) (not e!603736))))

(assert (=> d!129181 (= res!708188 ((_ is Cons!22407) Nil!22408))))

(assert (=> d!129181 (= (contains!6237 Nil!22408 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467612)))

(declare-fun b!1060648 () Bool)

(declare-fun e!603735 () Bool)

(assert (=> b!1060648 (= e!603736 e!603735)))

(declare-fun res!708187 () Bool)

(assert (=> b!1060648 (=> res!708187 e!603735)))

(assert (=> b!1060648 (= res!708187 (= (h!23625 Nil!22408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1060649 () Bool)

(assert (=> b!1060649 (= e!603735 (contains!6237 (t!31710 Nil!22408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129181 res!708188) b!1060648))

(assert (= (and b!1060648 (not res!708187)) b!1060649))

(declare-fun m!980459 () Bool)

(assert (=> d!129181 m!980459))

(declare-fun m!980461 () Bool)

(assert (=> d!129181 m!980461))

(declare-fun m!980463 () Bool)

(assert (=> b!1060649 m!980463))

(assert (=> b!1060576 d!129181))

(declare-fun d!129183 () Bool)

(declare-fun lt!467613 () Bool)

(assert (=> d!129183 (= lt!467613 (select (content!537 Nil!22408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!603738 () Bool)

(assert (=> d!129183 (= lt!467613 e!603738)))

(declare-fun res!708190 () Bool)

(assert (=> d!129183 (=> (not res!708190) (not e!603738))))

(assert (=> d!129183 (= res!708190 ((_ is Cons!22407) Nil!22408))))

(assert (=> d!129183 (= (contains!6237 Nil!22408 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467613)))

(declare-fun b!1060650 () Bool)

(declare-fun e!603737 () Bool)

(assert (=> b!1060650 (= e!603738 e!603737)))

(declare-fun res!708189 () Bool)

(assert (=> b!1060650 (=> res!708189 e!603737)))

(assert (=> b!1060650 (= res!708189 (= (h!23625 Nil!22408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1060651 () Bool)

(assert (=> b!1060651 (= e!603737 (contains!6237 (t!31710 Nil!22408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129183 res!708190) b!1060650))

(assert (= (and b!1060650 (not res!708189)) b!1060651))

(assert (=> d!129183 m!980459))

(declare-fun m!980465 () Bool)

(assert (=> d!129183 m!980465))

(declare-fun m!980467 () Bool)

(assert (=> b!1060651 m!980467))

(assert (=> b!1060583 d!129183))

(declare-fun d!129185 () Bool)

(assert (=> d!129185 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93850 d!129185))

(declare-fun d!129187 () Bool)

(assert (=> d!129187 (= (array_inv!24946 _values!955) (bvsge (size!32711 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93850 d!129187))

(declare-fun d!129189 () Bool)

(assert (=> d!129189 (= (array_inv!24947 _keys!1163) (bvsge (size!32710 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93850 d!129189))

(declare-fun b!1060660 () Bool)

(declare-fun e!603745 () Bool)

(declare-fun call!44951 () Bool)

(assert (=> b!1060660 (= e!603745 call!44951)))

(declare-fun b!1060662 () Bool)

(declare-fun e!603747 () Bool)

(assert (=> b!1060662 (= e!603747 e!603745)))

(declare-fun c!107603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060662 (= c!107603 (validKeyInArray!0 (select (arr!32173 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1060663 () Bool)

(declare-fun e!603746 () Bool)

(assert (=> b!1060663 (= e!603745 e!603746)))

(declare-fun lt!467620 () (_ BitVec 64))

(assert (=> b!1060663 (= lt!467620 (select (arr!32173 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34729 0))(
  ( (Unit!34730) )
))
(declare-fun lt!467621 () Unit!34729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66937 (_ BitVec 64) (_ BitVec 32)) Unit!34729)

(assert (=> b!1060663 (= lt!467621 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467620 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060663 (arrayContainsKey!0 _keys!1163 lt!467620 #b00000000000000000000000000000000)))

(declare-fun lt!467622 () Unit!34729)

(assert (=> b!1060663 (= lt!467622 lt!467621)))

(declare-fun res!708196 () Bool)

(declare-datatypes ((SeekEntryResult!9824 0))(
  ( (MissingZero!9824 (index!41667 (_ BitVec 32))) (Found!9824 (index!41668 (_ BitVec 32))) (Intermediate!9824 (undefined!10636 Bool) (index!41669 (_ BitVec 32)) (x!94633 (_ BitVec 32))) (Undefined!9824) (MissingVacant!9824 (index!41670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66937 (_ BitVec 32)) SeekEntryResult!9824)

(assert (=> b!1060663 (= res!708196 (= (seekEntryOrOpen!0 (select (arr!32173 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9824 #b00000000000000000000000000000000)))))

(assert (=> b!1060663 (=> (not res!708196) (not e!603746))))

(declare-fun bm!44948 () Bool)

(assert (=> bm!44948 (= call!44951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1060661 () Bool)

(assert (=> b!1060661 (= e!603746 call!44951)))

(declare-fun d!129191 () Bool)

(declare-fun res!708195 () Bool)

(assert (=> d!129191 (=> res!708195 e!603747)))

(assert (=> d!129191 (= res!708195 (bvsge #b00000000000000000000000000000000 (size!32710 _keys!1163)))))

(assert (=> d!129191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603747)))

(assert (= (and d!129191 (not res!708195)) b!1060662))

(assert (= (and b!1060662 c!107603) b!1060663))

(assert (= (and b!1060662 (not c!107603)) b!1060660))

(assert (= (and b!1060663 res!708196) b!1060661))

(assert (= (or b!1060661 b!1060660) bm!44948))

(declare-fun m!980469 () Bool)

(assert (=> b!1060662 m!980469))

(assert (=> b!1060662 m!980469))

(declare-fun m!980471 () Bool)

(assert (=> b!1060662 m!980471))

(assert (=> b!1060663 m!980469))

(declare-fun m!980473 () Bool)

(assert (=> b!1060663 m!980473))

(declare-fun m!980475 () Bool)

(assert (=> b!1060663 m!980475))

(assert (=> b!1060663 m!980469))

(declare-fun m!980477 () Bool)

(assert (=> b!1060663 m!980477))

(declare-fun m!980479 () Bool)

(assert (=> bm!44948 m!980479))

(assert (=> b!1060575 d!129191))

(declare-fun mapIsEmpty!39067 () Bool)

(declare-fun mapRes!39067 () Bool)

(assert (=> mapIsEmpty!39067 mapRes!39067))

(declare-fun b!1060671 () Bool)

(declare-fun e!603753 () Bool)

(assert (=> b!1060671 (= e!603753 tp_is_empty!24931)))

(declare-fun b!1060670 () Bool)

(declare-fun e!603752 () Bool)

(assert (=> b!1060670 (= e!603752 tp_is_empty!24931)))

(declare-fun condMapEmpty!39067 () Bool)

(declare-fun mapDefault!39067 () ValueCell!11762)

(assert (=> mapNonEmpty!39058 (= condMapEmpty!39067 (= mapRest!39058 ((as const (Array (_ BitVec 32) ValueCell!11762)) mapDefault!39067)))))

(assert (=> mapNonEmpty!39058 (= tp!74864 (and e!603753 mapRes!39067))))

(declare-fun mapNonEmpty!39067 () Bool)

(declare-fun tp!74873 () Bool)

(assert (=> mapNonEmpty!39067 (= mapRes!39067 (and tp!74873 e!603752))))

(declare-fun mapValue!39067 () ValueCell!11762)

(declare-fun mapRest!39067 () (Array (_ BitVec 32) ValueCell!11762))

(declare-fun mapKey!39067 () (_ BitVec 32))

(assert (=> mapNonEmpty!39067 (= mapRest!39058 (store mapRest!39067 mapKey!39067 mapValue!39067))))

(assert (= (and mapNonEmpty!39058 condMapEmpty!39067) mapIsEmpty!39067))

(assert (= (and mapNonEmpty!39058 (not condMapEmpty!39067)) mapNonEmpty!39067))

(assert (= (and mapNonEmpty!39067 ((_ is ValueCellFull!11762) mapValue!39067)) b!1060670))

(assert (= (and mapNonEmpty!39058 ((_ is ValueCellFull!11762) mapDefault!39067)) b!1060671))

(declare-fun m!980481 () Bool)

(assert (=> mapNonEmpty!39067 m!980481))

(check-sat (not bm!44948) (not d!129183) (not b!1060651) (not d!129181) (not b!1060649) (not b!1060663) tp_is_empty!24931 (not b!1060643) (not mapNonEmpty!39067) (not b!1060642) (not b!1060662))
(check-sat)
