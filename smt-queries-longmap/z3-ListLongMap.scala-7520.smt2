; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95596 () Bool)

(assert start!95596)

(declare-fun b!1078529 () Bool)

(declare-fun e!616742 () Bool)

(declare-fun tp_is_empty!26095 () Bool)

(assert (=> b!1078529 (= e!616742 tp_is_empty!26095)))

(declare-fun mapIsEmpty!40879 () Bool)

(declare-fun mapRes!40879 () Bool)

(assert (=> mapIsEmpty!40879 mapRes!40879))

(declare-fun b!1078530 () Bool)

(declare-fun e!616741 () Bool)

(assert (=> b!1078530 (= e!616741 tp_is_empty!26095)))

(declare-fun b!1078532 () Bool)

(declare-fun res!718306 () Bool)

(declare-fun e!616743 () Bool)

(assert (=> b!1078532 (=> (not res!718306) (not e!616743))))

(declare-datatypes ((array!69177 0))(
  ( (array!69178 (arr!33262 (Array (_ BitVec 32) (_ BitVec 64))) (size!33799 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69177)

(assert (=> b!1078532 (= res!718306 (and (bvsle #b00000000000000000000000000000000 (size!33799 _keys!1070)) (bvslt (size!33799 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078533 () Bool)

(declare-datatypes ((List!23222 0))(
  ( (Nil!23219) (Cons!23218 (h!24436 (_ BitVec 64)) (t!32573 List!23222)) )
))
(declare-fun noDuplicate!1587 (List!23222) Bool)

(assert (=> b!1078533 (= e!616743 (not (noDuplicate!1587 Nil!23219)))))

(declare-fun b!1078534 () Bool)

(declare-fun res!718308 () Bool)

(assert (=> b!1078534 (=> (not res!718308) (not e!616743))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69177 (_ BitVec 32)) Bool)

(assert (=> b!1078534 (= res!718308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078535 () Bool)

(declare-fun e!616740 () Bool)

(assert (=> b!1078535 (= e!616740 (and e!616742 mapRes!40879))))

(declare-fun condMapEmpty!40879 () Bool)

(declare-datatypes ((V!39921 0))(
  ( (V!39922 (val!13104 Int)) )
))
(declare-datatypes ((ValueCell!12338 0))(
  ( (ValueCellFull!12338 (v!15719 V!39921)) (EmptyCell!12338) )
))
(declare-datatypes ((array!69179 0))(
  ( (array!69180 (arr!33263 (Array (_ BitVec 32) ValueCell!12338)) (size!33800 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69179)

(declare-fun mapDefault!40879 () ValueCell!12338)

(assert (=> b!1078535 (= condMapEmpty!40879 (= (arr!33263 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12338)) mapDefault!40879)))))

(declare-fun mapNonEmpty!40879 () Bool)

(declare-fun tp!78341 () Bool)

(assert (=> mapNonEmpty!40879 (= mapRes!40879 (and tp!78341 e!616741))))

(declare-fun mapValue!40879 () ValueCell!12338)

(declare-fun mapRest!40879 () (Array (_ BitVec 32) ValueCell!12338))

(declare-fun mapKey!40879 () (_ BitVec 32))

(assert (=> mapNonEmpty!40879 (= (arr!33263 _values!874) (store mapRest!40879 mapKey!40879 mapValue!40879))))

(declare-fun b!1078531 () Bool)

(declare-fun res!718305 () Bool)

(assert (=> b!1078531 (=> (not res!718305) (not e!616743))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078531 (= res!718305 (and (= (size!33800 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33799 _keys!1070) (size!33800 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!718307 () Bool)

(assert (=> start!95596 (=> (not res!718307) (not e!616743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95596 (= res!718307 (validMask!0 mask!1414))))

(assert (=> start!95596 e!616743))

(assert (=> start!95596 true))

(declare-fun array_inv!25740 (array!69179) Bool)

(assert (=> start!95596 (and (array_inv!25740 _values!874) e!616740)))

(declare-fun array_inv!25741 (array!69177) Bool)

(assert (=> start!95596 (array_inv!25741 _keys!1070)))

(assert (= (and start!95596 res!718307) b!1078531))

(assert (= (and b!1078531 res!718305) b!1078534))

(assert (= (and b!1078534 res!718308) b!1078532))

(assert (= (and b!1078532 res!718306) b!1078533))

(assert (= (and b!1078535 condMapEmpty!40879) mapIsEmpty!40879))

(assert (= (and b!1078535 (not condMapEmpty!40879)) mapNonEmpty!40879))

(get-info :version)

(assert (= (and mapNonEmpty!40879 ((_ is ValueCellFull!12338) mapValue!40879)) b!1078530))

(assert (= (and b!1078535 ((_ is ValueCellFull!12338) mapDefault!40879)) b!1078529))

(assert (= start!95596 b!1078535))

(declare-fun m!997817 () Bool)

(assert (=> b!1078533 m!997817))

(declare-fun m!997819 () Bool)

(assert (=> b!1078534 m!997819))

(declare-fun m!997821 () Bool)

(assert (=> mapNonEmpty!40879 m!997821))

(declare-fun m!997823 () Bool)

(assert (=> start!95596 m!997823))

(declare-fun m!997825 () Bool)

(assert (=> start!95596 m!997825))

(declare-fun m!997827 () Bool)

(assert (=> start!95596 m!997827))

(check-sat (not b!1078534) (not start!95596) tp_is_empty!26095 (not b!1078533) (not mapNonEmpty!40879))
(check-sat)
(get-model)

(declare-fun d!130289 () Bool)

(assert (=> d!130289 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95596 d!130289))

(declare-fun d!130291 () Bool)

(assert (=> d!130291 (= (array_inv!25740 _values!874) (bvsge (size!33800 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95596 d!130291))

(declare-fun d!130293 () Bool)

(assert (=> d!130293 (= (array_inv!25741 _keys!1070) (bvsge (size!33799 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95596 d!130293))

(declare-fun b!1078586 () Bool)

(declare-fun e!616780 () Bool)

(declare-fun call!45783 () Bool)

(assert (=> b!1078586 (= e!616780 call!45783)))

(declare-fun b!1078587 () Bool)

(declare-fun e!616782 () Bool)

(assert (=> b!1078587 (= e!616782 e!616780)))

(declare-fun c!108720 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078587 (= c!108720 (validKeyInArray!0 (select (arr!33262 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078588 () Bool)

(declare-fun e!616781 () Bool)

(assert (=> b!1078588 (= e!616781 call!45783)))

(declare-fun b!1078589 () Bool)

(assert (=> b!1078589 (= e!616780 e!616781)))

(declare-fun lt!479041 () (_ BitVec 64))

(assert (=> b!1078589 (= lt!479041 (select (arr!33262 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35429 0))(
  ( (Unit!35430) )
))
(declare-fun lt!479040 () Unit!35429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69177 (_ BitVec 64) (_ BitVec 32)) Unit!35429)

(assert (=> b!1078589 (= lt!479040 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479041 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078589 (arrayContainsKey!0 _keys!1070 lt!479041 #b00000000000000000000000000000000)))

(declare-fun lt!479039 () Unit!35429)

(assert (=> b!1078589 (= lt!479039 lt!479040)))

(declare-fun res!718338 () Bool)

(declare-datatypes ((SeekEntryResult!9854 0))(
  ( (MissingZero!9854 (index!41787 (_ BitVec 32))) (Found!9854 (index!41788 (_ BitVec 32))) (Intermediate!9854 (undefined!10666 Bool) (index!41789 (_ BitVec 32)) (x!96539 (_ BitVec 32))) (Undefined!9854) (MissingVacant!9854 (index!41790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69177 (_ BitVec 32)) SeekEntryResult!9854)

(assert (=> b!1078589 (= res!718338 (= (seekEntryOrOpen!0 (select (arr!33262 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9854 #b00000000000000000000000000000000)))))

(assert (=> b!1078589 (=> (not res!718338) (not e!616781))))

(declare-fun bm!45780 () Bool)

(assert (=> bm!45780 (= call!45783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130295 () Bool)

(declare-fun res!718337 () Bool)

(assert (=> d!130295 (=> res!718337 e!616782)))

(assert (=> d!130295 (= res!718337 (bvsge #b00000000000000000000000000000000 (size!33799 _keys!1070)))))

(assert (=> d!130295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616782)))

(assert (= (and d!130295 (not res!718337)) b!1078587))

(assert (= (and b!1078587 c!108720) b!1078589))

(assert (= (and b!1078587 (not c!108720)) b!1078586))

(assert (= (and b!1078589 res!718338) b!1078588))

(assert (= (or b!1078588 b!1078586) bm!45780))

(declare-fun m!997853 () Bool)

(assert (=> b!1078587 m!997853))

(assert (=> b!1078587 m!997853))

(declare-fun m!997855 () Bool)

(assert (=> b!1078587 m!997855))

(assert (=> b!1078589 m!997853))

(declare-fun m!997857 () Bool)

(assert (=> b!1078589 m!997857))

(declare-fun m!997859 () Bool)

(assert (=> b!1078589 m!997859))

(assert (=> b!1078589 m!997853))

(declare-fun m!997861 () Bool)

(assert (=> b!1078589 m!997861))

(declare-fun m!997863 () Bool)

(assert (=> bm!45780 m!997863))

(assert (=> b!1078534 d!130295))

(declare-fun d!130297 () Bool)

(declare-fun res!718343 () Bool)

(declare-fun e!616787 () Bool)

(assert (=> d!130297 (=> res!718343 e!616787)))

(assert (=> d!130297 (= res!718343 ((_ is Nil!23219) Nil!23219))))

(assert (=> d!130297 (= (noDuplicate!1587 Nil!23219) e!616787)))

(declare-fun b!1078594 () Bool)

(declare-fun e!616788 () Bool)

(assert (=> b!1078594 (= e!616787 e!616788)))

(declare-fun res!718344 () Bool)

(assert (=> b!1078594 (=> (not res!718344) (not e!616788))))

(declare-fun contains!6391 (List!23222 (_ BitVec 64)) Bool)

(assert (=> b!1078594 (= res!718344 (not (contains!6391 (t!32573 Nil!23219) (h!24436 Nil!23219))))))

(declare-fun b!1078595 () Bool)

(assert (=> b!1078595 (= e!616788 (noDuplicate!1587 (t!32573 Nil!23219)))))

(assert (= (and d!130297 (not res!718343)) b!1078594))

(assert (= (and b!1078594 res!718344) b!1078595))

(declare-fun m!997865 () Bool)

(assert (=> b!1078594 m!997865))

(declare-fun m!997867 () Bool)

(assert (=> b!1078595 m!997867))

(assert (=> b!1078533 d!130297))

(declare-fun mapNonEmpty!40888 () Bool)

(declare-fun mapRes!40888 () Bool)

(declare-fun tp!78350 () Bool)

(declare-fun e!616794 () Bool)

(assert (=> mapNonEmpty!40888 (= mapRes!40888 (and tp!78350 e!616794))))

(declare-fun mapRest!40888 () (Array (_ BitVec 32) ValueCell!12338))

(declare-fun mapValue!40888 () ValueCell!12338)

(declare-fun mapKey!40888 () (_ BitVec 32))

(assert (=> mapNonEmpty!40888 (= mapRest!40879 (store mapRest!40888 mapKey!40888 mapValue!40888))))

(declare-fun condMapEmpty!40888 () Bool)

(declare-fun mapDefault!40888 () ValueCell!12338)

(assert (=> mapNonEmpty!40879 (= condMapEmpty!40888 (= mapRest!40879 ((as const (Array (_ BitVec 32) ValueCell!12338)) mapDefault!40888)))))

(declare-fun e!616793 () Bool)

(assert (=> mapNonEmpty!40879 (= tp!78341 (and e!616793 mapRes!40888))))

(declare-fun b!1078602 () Bool)

(assert (=> b!1078602 (= e!616794 tp_is_empty!26095)))

(declare-fun mapIsEmpty!40888 () Bool)

(assert (=> mapIsEmpty!40888 mapRes!40888))

(declare-fun b!1078603 () Bool)

(assert (=> b!1078603 (= e!616793 tp_is_empty!26095)))

(assert (= (and mapNonEmpty!40879 condMapEmpty!40888) mapIsEmpty!40888))

(assert (= (and mapNonEmpty!40879 (not condMapEmpty!40888)) mapNonEmpty!40888))

(assert (= (and mapNonEmpty!40888 ((_ is ValueCellFull!12338) mapValue!40888)) b!1078602))

(assert (= (and mapNonEmpty!40879 ((_ is ValueCellFull!12338) mapDefault!40888)) b!1078603))

(declare-fun m!997869 () Bool)

(assert (=> mapNonEmpty!40888 m!997869))

(check-sat (not b!1078587) (not b!1078589) (not b!1078594) (not mapNonEmpty!40888) tp_is_empty!26095 (not b!1078595) (not bm!45780))
(check-sat)
