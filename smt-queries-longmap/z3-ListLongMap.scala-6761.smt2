; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85008 () Bool)

(assert start!85008)

(declare-fun mapNonEmpty!37077 () Bool)

(declare-fun mapRes!37077 () Bool)

(declare-fun tp!70149 () Bool)

(declare-fun e!559874 () Bool)

(assert (=> mapNonEmpty!37077 (= mapRes!37077 (and tp!70149 e!559874))))

(declare-fun mapKey!37077 () (_ BitVec 32))

(declare-datatypes ((V!36105 0))(
  ( (V!36106 (val!11721 Int)) )
))
(declare-datatypes ((ValueCell!11189 0))(
  ( (ValueCellFull!11189 (v!14294 V!36105)) (EmptyCell!11189) )
))
(declare-fun mapValue!37077 () ValueCell!11189)

(declare-fun mapRest!37077 () (Array (_ BitVec 32) ValueCell!11189))

(declare-datatypes ((array!62696 0))(
  ( (array!62697 (arr!30190 (Array (_ BitVec 32) ValueCell!11189)) (size!30670 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62696)

(assert (=> mapNonEmpty!37077 (= (arr!30190 _values!1551) (store mapRest!37077 mapKey!37077 mapValue!37077))))

(declare-fun b!992546 () Bool)

(declare-fun e!559876 () Bool)

(declare-fun tp_is_empty!23341 () Bool)

(assert (=> b!992546 (= e!559876 tp_is_empty!23341)))

(declare-fun b!992547 () Bool)

(declare-fun res!663180 () Bool)

(declare-fun e!559872 () Bool)

(assert (=> b!992547 (=> (not res!663180) (not e!559872))))

(declare-datatypes ((array!62698 0))(
  ( (array!62699 (arr!30191 (Array (_ BitVec 32) (_ BitVec 64))) (size!30671 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62698)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62698 (_ BitVec 32)) Bool)

(assert (=> b!992547 (= res!663180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992548 () Bool)

(declare-fun res!663181 () Bool)

(assert (=> b!992548 (=> (not res!663181) (not e!559872))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992548 (= res!663181 (and (= (size!30670 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30671 _keys!1945) (size!30670 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!992549 () Bool)

(declare-datatypes ((List!20848 0))(
  ( (Nil!20845) (Cons!20844 (h!22012 (_ BitVec 64)) (t!29823 List!20848)) )
))
(declare-fun noDuplicate!1388 (List!20848) Bool)

(assert (=> b!992549 (= e!559872 (not (noDuplicate!1388 Nil!20845)))))

(declare-fun b!992550 () Bool)

(assert (=> b!992550 (= e!559874 tp_is_empty!23341)))

(declare-fun b!992551 () Bool)

(declare-fun e!559873 () Bool)

(assert (=> b!992551 (= e!559873 (and e!559876 mapRes!37077))))

(declare-fun condMapEmpty!37077 () Bool)

(declare-fun mapDefault!37077 () ValueCell!11189)

(assert (=> b!992551 (= condMapEmpty!37077 (= (arr!30190 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11189)) mapDefault!37077)))))

(declare-fun b!992552 () Bool)

(declare-fun res!663183 () Bool)

(assert (=> b!992552 (=> (not res!663183) (not e!559872))))

(assert (=> b!992552 (= res!663183 (and (bvsle #b00000000000000000000000000000000 (size!30671 _keys!1945)) (bvslt (size!30671 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun res!663182 () Bool)

(assert (=> start!85008 (=> (not res!663182) (not e!559872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85008 (= res!663182 (validMask!0 mask!2471))))

(assert (=> start!85008 e!559872))

(assert (=> start!85008 true))

(declare-fun array_inv!23339 (array!62696) Bool)

(assert (=> start!85008 (and (array_inv!23339 _values!1551) e!559873)))

(declare-fun array_inv!23340 (array!62698) Bool)

(assert (=> start!85008 (array_inv!23340 _keys!1945)))

(declare-fun mapIsEmpty!37077 () Bool)

(assert (=> mapIsEmpty!37077 mapRes!37077))

(assert (= (and start!85008 res!663182) b!992548))

(assert (= (and b!992548 res!663181) b!992547))

(assert (= (and b!992547 res!663180) b!992552))

(assert (= (and b!992552 res!663183) b!992549))

(assert (= (and b!992551 condMapEmpty!37077) mapIsEmpty!37077))

(assert (= (and b!992551 (not condMapEmpty!37077)) mapNonEmpty!37077))

(get-info :version)

(assert (= (and mapNonEmpty!37077 ((_ is ValueCellFull!11189) mapValue!37077)) b!992550))

(assert (= (and b!992551 ((_ is ValueCellFull!11189) mapDefault!37077)) b!992546))

(assert (= start!85008 b!992551))

(declare-fun m!920805 () Bool)

(assert (=> mapNonEmpty!37077 m!920805))

(declare-fun m!920807 () Bool)

(assert (=> b!992547 m!920807))

(declare-fun m!920809 () Bool)

(assert (=> b!992549 m!920809))

(declare-fun m!920811 () Bool)

(assert (=> start!85008 m!920811))

(declare-fun m!920813 () Bool)

(assert (=> start!85008 m!920813))

(declare-fun m!920815 () Bool)

(assert (=> start!85008 m!920815))

(check-sat tp_is_empty!23341 (not b!992547) (not b!992549) (not start!85008) (not mapNonEmpty!37077))
(check-sat)
(get-model)

(declare-fun d!118289 () Bool)

(declare-fun res!663212 () Bool)

(declare-fun e!559911 () Bool)

(assert (=> d!118289 (=> res!663212 e!559911)))

(assert (=> d!118289 (= res!663212 ((_ is Nil!20845) Nil!20845))))

(assert (=> d!118289 (= (noDuplicate!1388 Nil!20845) e!559911)))

(declare-fun b!992599 () Bool)

(declare-fun e!559912 () Bool)

(assert (=> b!992599 (= e!559911 e!559912)))

(declare-fun res!663213 () Bool)

(assert (=> b!992599 (=> (not res!663213) (not e!559912))))

(declare-fun contains!5751 (List!20848 (_ BitVec 64)) Bool)

(assert (=> b!992599 (= res!663213 (not (contains!5751 (t!29823 Nil!20845) (h!22012 Nil!20845))))))

(declare-fun b!992600 () Bool)

(assert (=> b!992600 (= e!559912 (noDuplicate!1388 (t!29823 Nil!20845)))))

(assert (= (and d!118289 (not res!663212)) b!992599))

(assert (= (and b!992599 res!663213) b!992600))

(declare-fun m!920841 () Bool)

(assert (=> b!992599 m!920841))

(declare-fun m!920843 () Bool)

(assert (=> b!992600 m!920843))

(assert (=> b!992549 d!118289))

(declare-fun d!118291 () Bool)

(declare-fun res!663218 () Bool)

(declare-fun e!559920 () Bool)

(assert (=> d!118291 (=> res!663218 e!559920)))

(assert (=> d!118291 (= res!663218 (bvsge #b00000000000000000000000000000000 (size!30671 _keys!1945)))))

(assert (=> d!118291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559920)))

(declare-fun b!992609 () Bool)

(declare-fun e!559919 () Bool)

(assert (=> b!992609 (= e!559920 e!559919)))

(declare-fun c!100915 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992609 (= c!100915 (validKeyInArray!0 (select (arr!30191 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!992610 () Bool)

(declare-fun e!559921 () Bool)

(declare-fun call!42127 () Bool)

(assert (=> b!992610 (= e!559921 call!42127)))

(declare-fun b!992611 () Bool)

(assert (=> b!992611 (= e!559919 call!42127)))

(declare-fun bm!42124 () Bool)

(assert (=> bm!42124 (= call!42127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!992612 () Bool)

(assert (=> b!992612 (= e!559919 e!559921)))

(declare-fun lt!440370 () (_ BitVec 64))

(assert (=> b!992612 (= lt!440370 (select (arr!30191 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32887 0))(
  ( (Unit!32888) )
))
(declare-fun lt!440371 () Unit!32887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62698 (_ BitVec 64) (_ BitVec 32)) Unit!32887)

(assert (=> b!992612 (= lt!440371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440370 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992612 (arrayContainsKey!0 _keys!1945 lt!440370 #b00000000000000000000000000000000)))

(declare-fun lt!440369 () Unit!32887)

(assert (=> b!992612 (= lt!440369 lt!440371)))

(declare-fun res!663219 () Bool)

(declare-datatypes ((SeekEntryResult!9171 0))(
  ( (MissingZero!9171 (index!39055 (_ BitVec 32))) (Found!9171 (index!39056 (_ BitVec 32))) (Intermediate!9171 (undefined!9983 Bool) (index!39057 (_ BitVec 32)) (x!86256 (_ BitVec 32))) (Undefined!9171) (MissingVacant!9171 (index!39058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62698 (_ BitVec 32)) SeekEntryResult!9171)

(assert (=> b!992612 (= res!663219 (= (seekEntryOrOpen!0 (select (arr!30191 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9171 #b00000000000000000000000000000000)))))

(assert (=> b!992612 (=> (not res!663219) (not e!559921))))

(assert (= (and d!118291 (not res!663218)) b!992609))

(assert (= (and b!992609 c!100915) b!992612))

(assert (= (and b!992609 (not c!100915)) b!992611))

(assert (= (and b!992612 res!663219) b!992610))

(assert (= (or b!992610 b!992611) bm!42124))

(declare-fun m!920845 () Bool)

(assert (=> b!992609 m!920845))

(assert (=> b!992609 m!920845))

(declare-fun m!920847 () Bool)

(assert (=> b!992609 m!920847))

(declare-fun m!920849 () Bool)

(assert (=> bm!42124 m!920849))

(assert (=> b!992612 m!920845))

(declare-fun m!920851 () Bool)

(assert (=> b!992612 m!920851))

(declare-fun m!920853 () Bool)

(assert (=> b!992612 m!920853))

(assert (=> b!992612 m!920845))

(declare-fun m!920855 () Bool)

(assert (=> b!992612 m!920855))

(assert (=> b!992547 d!118291))

(declare-fun d!118293 () Bool)

(assert (=> d!118293 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!85008 d!118293))

(declare-fun d!118295 () Bool)

(assert (=> d!118295 (= (array_inv!23339 _values!1551) (bvsge (size!30670 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!85008 d!118295))

(declare-fun d!118297 () Bool)

(assert (=> d!118297 (= (array_inv!23340 _keys!1945) (bvsge (size!30671 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!85008 d!118297))

(declare-fun mapNonEmpty!37086 () Bool)

(declare-fun mapRes!37086 () Bool)

(declare-fun tp!70158 () Bool)

(declare-fun e!559927 () Bool)

(assert (=> mapNonEmpty!37086 (= mapRes!37086 (and tp!70158 e!559927))))

(declare-fun mapValue!37086 () ValueCell!11189)

(declare-fun mapKey!37086 () (_ BitVec 32))

(declare-fun mapRest!37086 () (Array (_ BitVec 32) ValueCell!11189))

(assert (=> mapNonEmpty!37086 (= mapRest!37077 (store mapRest!37086 mapKey!37086 mapValue!37086))))

(declare-fun condMapEmpty!37086 () Bool)

(declare-fun mapDefault!37086 () ValueCell!11189)

(assert (=> mapNonEmpty!37077 (= condMapEmpty!37086 (= mapRest!37077 ((as const (Array (_ BitVec 32) ValueCell!11189)) mapDefault!37086)))))

(declare-fun e!559926 () Bool)

(assert (=> mapNonEmpty!37077 (= tp!70149 (and e!559926 mapRes!37086))))

(declare-fun mapIsEmpty!37086 () Bool)

(assert (=> mapIsEmpty!37086 mapRes!37086))

(declare-fun b!992619 () Bool)

(assert (=> b!992619 (= e!559927 tp_is_empty!23341)))

(declare-fun b!992620 () Bool)

(assert (=> b!992620 (= e!559926 tp_is_empty!23341)))

(assert (= (and mapNonEmpty!37077 condMapEmpty!37086) mapIsEmpty!37086))

(assert (= (and mapNonEmpty!37077 (not condMapEmpty!37086)) mapNonEmpty!37086))

(assert (= (and mapNonEmpty!37086 ((_ is ValueCellFull!11189) mapValue!37086)) b!992619))

(assert (= (and mapNonEmpty!37077 ((_ is ValueCellFull!11189) mapDefault!37086)) b!992620))

(declare-fun m!920857 () Bool)

(assert (=> mapNonEmpty!37086 m!920857))

(check-sat (not bm!42124) (not mapNonEmpty!37086) (not b!992599) (not b!992600) tp_is_empty!23341 (not b!992612) (not b!992609))
(check-sat)
