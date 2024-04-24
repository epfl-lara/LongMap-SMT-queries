; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93834 () Bool)

(assert start!93834)

(declare-fun b!1060482 () Bool)

(declare-fun res!708084 () Bool)

(declare-fun e!603618 () Bool)

(assert (=> b!1060482 (=> (not res!708084) (not e!603618))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38369 0))(
  ( (V!38370 (val!12513 Int)) )
))
(declare-datatypes ((ValueCell!11759 0))(
  ( (ValueCellFull!11759 (v!15118 V!38369)) (EmptyCell!11759) )
))
(declare-datatypes ((array!66923 0))(
  ( (array!66924 (arr!32167 (Array (_ BitVec 32) ValueCell!11759)) (size!32704 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66923)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66925 0))(
  ( (array!66926 (arr!32168 (Array (_ BitVec 32) (_ BitVec 64))) (size!32705 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66925)

(assert (=> b!1060482 (= res!708084 (and (= (size!32704 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32705 _keys!1163) (size!32704 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060483 () Bool)

(declare-datatypes ((List!22410 0))(
  ( (Nil!22407) (Cons!22406 (h!23624 (_ BitVec 64)) (t!31709 List!22410)) )
))
(declare-fun noDuplicate!1585 (List!22410) Bool)

(assert (=> b!1060483 (= e!603618 (not (noDuplicate!1585 Nil!22407)))))

(declare-fun mapIsEmpty!39046 () Bool)

(declare-fun mapRes!39046 () Bool)

(assert (=> mapIsEmpty!39046 mapRes!39046))

(declare-fun mapNonEmpty!39046 () Bool)

(declare-fun tp!74852 () Bool)

(declare-fun e!603619 () Bool)

(assert (=> mapNonEmpty!39046 (= mapRes!39046 (and tp!74852 e!603619))))

(declare-fun mapKey!39046 () (_ BitVec 32))

(declare-fun mapRest!39046 () (Array (_ BitVec 32) ValueCell!11759))

(declare-fun mapValue!39046 () ValueCell!11759)

(assert (=> mapNonEmpty!39046 (= (arr!32167 _values!955) (store mapRest!39046 mapKey!39046 mapValue!39046))))

(declare-fun b!1060485 () Bool)

(declare-fun e!603615 () Bool)

(declare-fun tp_is_empty!24925 () Bool)

(assert (=> b!1060485 (= e!603615 tp_is_empty!24925)))

(declare-fun b!1060486 () Bool)

(declare-fun res!708083 () Bool)

(assert (=> b!1060486 (=> (not res!708083) (not e!603618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66925 (_ BitVec 32)) Bool)

(assert (=> b!1060486 (= res!708083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060487 () Bool)

(assert (=> b!1060487 (= e!603619 tp_is_empty!24925)))

(declare-fun b!1060488 () Bool)

(declare-fun res!708086 () Bool)

(assert (=> b!1060488 (=> (not res!708086) (not e!603618))))

(assert (=> b!1060488 (= res!708086 (and (bvsle #b00000000000000000000000000000000 (size!32705 _keys!1163)) (bvslt (size!32705 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1060484 () Bool)

(declare-fun e!603616 () Bool)

(assert (=> b!1060484 (= e!603616 (and e!603615 mapRes!39046))))

(declare-fun condMapEmpty!39046 () Bool)

(declare-fun mapDefault!39046 () ValueCell!11759)

(assert (=> b!1060484 (= condMapEmpty!39046 (= (arr!32167 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11759)) mapDefault!39046)))))

(declare-fun res!708085 () Bool)

(assert (=> start!93834 (=> (not res!708085) (not e!603618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93834 (= res!708085 (validMask!0 mask!1515))))

(assert (=> start!93834 e!603618))

(assert (=> start!93834 true))

(declare-fun array_inv!24940 (array!66923) Bool)

(assert (=> start!93834 (and (array_inv!24940 _values!955) e!603616)))

(declare-fun array_inv!24941 (array!66925) Bool)

(assert (=> start!93834 (array_inv!24941 _keys!1163)))

(assert (= (and start!93834 res!708085) b!1060482))

(assert (= (and b!1060482 res!708084) b!1060486))

(assert (= (and b!1060486 res!708083) b!1060488))

(assert (= (and b!1060488 res!708086) b!1060483))

(assert (= (and b!1060484 condMapEmpty!39046) mapIsEmpty!39046))

(assert (= (and b!1060484 (not condMapEmpty!39046)) mapNonEmpty!39046))

(get-info :version)

(assert (= (and mapNonEmpty!39046 ((_ is ValueCellFull!11759) mapValue!39046)) b!1060487))

(assert (= (and b!1060484 ((_ is ValueCellFull!11759) mapDefault!39046)) b!1060485))

(assert (= start!93834 b!1060484))

(declare-fun m!980353 () Bool)

(assert (=> b!1060483 m!980353))

(declare-fun m!980355 () Bool)

(assert (=> mapNonEmpty!39046 m!980355))

(declare-fun m!980357 () Bool)

(assert (=> b!1060486 m!980357))

(declare-fun m!980359 () Bool)

(assert (=> start!93834 m!980359))

(declare-fun m!980361 () Bool)

(assert (=> start!93834 m!980361))

(declare-fun m!980363 () Bool)

(assert (=> start!93834 m!980363))

(check-sat (not b!1060486) (not start!93834) (not b!1060483) tp_is_empty!24925 (not mapNonEmpty!39046))
(check-sat)
(get-model)

(declare-fun d!129167 () Bool)

(assert (=> d!129167 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93834 d!129167))

(declare-fun d!129169 () Bool)

(assert (=> d!129169 (= (array_inv!24940 _values!955) (bvsge (size!32704 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93834 d!129169))

(declare-fun d!129171 () Bool)

(assert (=> d!129171 (= (array_inv!24941 _keys!1163) (bvsge (size!32705 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93834 d!129171))

(declare-fun d!129173 () Bool)

(declare-fun res!708116 () Bool)

(declare-fun e!603656 () Bool)

(assert (=> d!129173 (=> res!708116 e!603656)))

(assert (=> d!129173 (= res!708116 (bvsge #b00000000000000000000000000000000 (size!32705 _keys!1163)))))

(assert (=> d!129173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603656)))

(declare-fun b!1060539 () Bool)

(declare-fun e!603657 () Bool)

(declare-fun call!44948 () Bool)

(assert (=> b!1060539 (= e!603657 call!44948)))

(declare-fun b!1060540 () Bool)

(assert (=> b!1060540 (= e!603656 e!603657)))

(declare-fun c!107600 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060540 (= c!107600 (validKeyInArray!0 (select (arr!32168 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44945 () Bool)

(assert (=> bm!44945 (= call!44948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1060541 () Bool)

(declare-fun e!603658 () Bool)

(assert (=> b!1060541 (= e!603658 call!44948)))

(declare-fun b!1060542 () Bool)

(assert (=> b!1060542 (= e!603657 e!603658)))

(declare-fun lt!467608 () (_ BitVec 64))

(assert (=> b!1060542 (= lt!467608 (select (arr!32168 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34727 0))(
  ( (Unit!34728) )
))
(declare-fun lt!467609 () Unit!34727)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66925 (_ BitVec 64) (_ BitVec 32)) Unit!34727)

(assert (=> b!1060542 (= lt!467609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467608 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060542 (arrayContainsKey!0 _keys!1163 lt!467608 #b00000000000000000000000000000000)))

(declare-fun lt!467607 () Unit!34727)

(assert (=> b!1060542 (= lt!467607 lt!467609)))

(declare-fun res!708115 () Bool)

(declare-datatypes ((SeekEntryResult!9823 0))(
  ( (MissingZero!9823 (index!41663 (_ BitVec 32))) (Found!9823 (index!41664 (_ BitVec 32))) (Intermediate!9823 (undefined!10635 Bool) (index!41665 (_ BitVec 32)) (x!94622 (_ BitVec 32))) (Undefined!9823) (MissingVacant!9823 (index!41666 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66925 (_ BitVec 32)) SeekEntryResult!9823)

(assert (=> b!1060542 (= res!708115 (= (seekEntryOrOpen!0 (select (arr!32168 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9823 #b00000000000000000000000000000000)))))

(assert (=> b!1060542 (=> (not res!708115) (not e!603658))))

(assert (= (and d!129173 (not res!708116)) b!1060540))

(assert (= (and b!1060540 c!107600) b!1060542))

(assert (= (and b!1060540 (not c!107600)) b!1060539))

(assert (= (and b!1060542 res!708115) b!1060541))

(assert (= (or b!1060541 b!1060539) bm!44945))

(declare-fun m!980389 () Bool)

(assert (=> b!1060540 m!980389))

(assert (=> b!1060540 m!980389))

(declare-fun m!980391 () Bool)

(assert (=> b!1060540 m!980391))

(declare-fun m!980393 () Bool)

(assert (=> bm!44945 m!980393))

(assert (=> b!1060542 m!980389))

(declare-fun m!980395 () Bool)

(assert (=> b!1060542 m!980395))

(declare-fun m!980397 () Bool)

(assert (=> b!1060542 m!980397))

(assert (=> b!1060542 m!980389))

(declare-fun m!980399 () Bool)

(assert (=> b!1060542 m!980399))

(assert (=> b!1060486 d!129173))

(declare-fun d!129175 () Bool)

(declare-fun res!708121 () Bool)

(declare-fun e!603663 () Bool)

(assert (=> d!129175 (=> res!708121 e!603663)))

(assert (=> d!129175 (= res!708121 ((_ is Nil!22407) Nil!22407))))

(assert (=> d!129175 (= (noDuplicate!1585 Nil!22407) e!603663)))

(declare-fun b!1060547 () Bool)

(declare-fun e!603664 () Bool)

(assert (=> b!1060547 (= e!603663 e!603664)))

(declare-fun res!708122 () Bool)

(assert (=> b!1060547 (=> (not res!708122) (not e!603664))))

(declare-fun contains!6236 (List!22410 (_ BitVec 64)) Bool)

(assert (=> b!1060547 (= res!708122 (not (contains!6236 (t!31709 Nil!22407) (h!23624 Nil!22407))))))

(declare-fun b!1060548 () Bool)

(assert (=> b!1060548 (= e!603664 (noDuplicate!1585 (t!31709 Nil!22407)))))

(assert (= (and d!129175 (not res!708121)) b!1060547))

(assert (= (and b!1060547 res!708122) b!1060548))

(declare-fun m!980401 () Bool)

(assert (=> b!1060547 m!980401))

(declare-fun m!980403 () Bool)

(assert (=> b!1060548 m!980403))

(assert (=> b!1060483 d!129175))

(declare-fun condMapEmpty!39055 () Bool)

(declare-fun mapDefault!39055 () ValueCell!11759)

(assert (=> mapNonEmpty!39046 (= condMapEmpty!39055 (= mapRest!39046 ((as const (Array (_ BitVec 32) ValueCell!11759)) mapDefault!39055)))))

(declare-fun e!603669 () Bool)

(declare-fun mapRes!39055 () Bool)

(assert (=> mapNonEmpty!39046 (= tp!74852 (and e!603669 mapRes!39055))))

(declare-fun b!1060555 () Bool)

(declare-fun e!603670 () Bool)

(assert (=> b!1060555 (= e!603670 tp_is_empty!24925)))

(declare-fun mapIsEmpty!39055 () Bool)

(assert (=> mapIsEmpty!39055 mapRes!39055))

(declare-fun b!1060556 () Bool)

(assert (=> b!1060556 (= e!603669 tp_is_empty!24925)))

(declare-fun mapNonEmpty!39055 () Bool)

(declare-fun tp!74861 () Bool)

(assert (=> mapNonEmpty!39055 (= mapRes!39055 (and tp!74861 e!603670))))

(declare-fun mapKey!39055 () (_ BitVec 32))

(declare-fun mapRest!39055 () (Array (_ BitVec 32) ValueCell!11759))

(declare-fun mapValue!39055 () ValueCell!11759)

(assert (=> mapNonEmpty!39055 (= mapRest!39046 (store mapRest!39055 mapKey!39055 mapValue!39055))))

(assert (= (and mapNonEmpty!39046 condMapEmpty!39055) mapIsEmpty!39055))

(assert (= (and mapNonEmpty!39046 (not condMapEmpty!39055)) mapNonEmpty!39055))

(assert (= (and mapNonEmpty!39055 ((_ is ValueCellFull!11759) mapValue!39055)) b!1060555))

(assert (= (and mapNonEmpty!39046 ((_ is ValueCellFull!11759) mapDefault!39055)) b!1060556))

(declare-fun m!980405 () Bool)

(assert (=> mapNonEmpty!39055 m!980405))

(check-sat (not b!1060540) (not b!1060547) tp_is_empty!24925 (not b!1060548) (not b!1060542) (not bm!44945) (not mapNonEmpty!39055))
(check-sat)
