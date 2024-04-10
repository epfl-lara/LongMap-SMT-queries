; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95464 () Bool)

(assert start!95464)

(declare-fun b!1078122 () Bool)

(declare-fun res!718381 () Bool)

(declare-fun e!616439 () Bool)

(assert (=> b!1078122 (=> (not res!718381) (not e!616439))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078122 (= res!718381 (validKeyInArray!0 k0!904))))

(declare-fun b!1078123 () Bool)

(declare-fun e!616437 () Bool)

(declare-fun e!616436 () Bool)

(declare-fun mapRes!40975 () Bool)

(assert (=> b!1078123 (= e!616437 (and e!616436 mapRes!40975))))

(declare-fun condMapEmpty!40975 () Bool)

(declare-datatypes ((V!39995 0))(
  ( (V!39996 (val!13132 Int)) )
))
(declare-datatypes ((ValueCell!12366 0))(
  ( (ValueCellFull!12366 (v!15752 V!39995)) (EmptyCell!12366) )
))
(declare-datatypes ((array!69255 0))(
  ( (array!69256 (arr!33303 (Array (_ BitVec 32) ValueCell!12366)) (size!33839 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69255)

(declare-fun mapDefault!40975 () ValueCell!12366)

(assert (=> b!1078123 (= condMapEmpty!40975 (= (arr!33303 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12366)) mapDefault!40975)))))

(declare-fun b!1078125 () Bool)

(declare-fun res!718387 () Bool)

(assert (=> b!1078125 (=> (not res!718387) (not e!616439))))

(declare-datatypes ((array!69257 0))(
  ( (array!69258 (arr!33304 (Array (_ BitVec 32) (_ BitVec 64))) (size!33840 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69257)

(assert (=> b!1078125 (= res!718387 (and (bvsle #b00000000000000000000000000000000 (size!33840 _keys!1070)) (bvslt (size!33840 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078126 () Bool)

(declare-fun res!718379 () Bool)

(assert (=> b!1078126 (=> (not res!718379) (not e!616439))))

(declare-datatypes ((List!23231 0))(
  ( (Nil!23228) (Cons!23227 (h!24436 (_ BitVec 64)) (t!32590 List!23231)) )
))
(declare-fun noDuplicate!1579 (List!23231) Bool)

(assert (=> b!1078126 (= res!718379 (noDuplicate!1579 Nil!23228))))

(declare-fun b!1078127 () Bool)

(declare-fun e!616434 () Bool)

(assert (=> b!1078127 (= e!616439 e!616434)))

(declare-fun res!718384 () Bool)

(assert (=> b!1078127 (=> res!718384 e!616434)))

(declare-fun contains!6372 (List!23231 (_ BitVec 64)) Bool)

(assert (=> b!1078127 (= res!718384 (contains!6372 Nil!23228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078128 () Bool)

(declare-fun res!718386 () Bool)

(assert (=> b!1078128 (=> (not res!718386) (not e!616439))))

(declare-fun arrayNoDuplicates!0 (array!69257 (_ BitVec 32) List!23231) Bool)

(assert (=> b!1078128 (= res!718386 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23228))))

(declare-fun b!1078129 () Bool)

(declare-fun res!718389 () Bool)

(assert (=> b!1078129 (=> (not res!718389) (not e!616439))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69257 (_ BitVec 32)) Bool)

(assert (=> b!1078129 (= res!718389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078130 () Bool)

(declare-fun res!718380 () Bool)

(assert (=> b!1078130 (=> (not res!718380) (not e!616439))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078130 (= res!718380 (= (select (arr!33304 _keys!1070) i!650) k0!904))))

(declare-fun b!1078131 () Bool)

(declare-fun res!718383 () Bool)

(assert (=> b!1078131 (=> (not res!718383) (not e!616439))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078131 (= res!718383 (and (= (size!33839 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33840 _keys!1070) (size!33839 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078132 () Bool)

(declare-fun res!718385 () Bool)

(assert (=> b!1078132 (=> (not res!718385) (not e!616439))))

(assert (=> b!1078132 (= res!718385 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33840 _keys!1070))))))

(declare-fun mapNonEmpty!40975 () Bool)

(declare-fun tp!78437 () Bool)

(declare-fun e!616435 () Bool)

(assert (=> mapNonEmpty!40975 (= mapRes!40975 (and tp!78437 e!616435))))

(declare-fun mapKey!40975 () (_ BitVec 32))

(declare-fun mapValue!40975 () ValueCell!12366)

(declare-fun mapRest!40975 () (Array (_ BitVec 32) ValueCell!12366))

(assert (=> mapNonEmpty!40975 (= (arr!33303 _values!874) (store mapRest!40975 mapKey!40975 mapValue!40975))))

(declare-fun b!1078133 () Bool)

(declare-fun tp_is_empty!26151 () Bool)

(assert (=> b!1078133 (= e!616435 tp_is_empty!26151)))

(declare-fun b!1078124 () Bool)

(assert (=> b!1078124 (= e!616434 (contains!6372 Nil!23228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!718382 () Bool)

(assert (=> start!95464 (=> (not res!718382) (not e!616439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95464 (= res!718382 (validMask!0 mask!1414))))

(assert (=> start!95464 e!616439))

(assert (=> start!95464 true))

(declare-fun array_inv!25726 (array!69257) Bool)

(assert (=> start!95464 (array_inv!25726 _keys!1070)))

(declare-fun array_inv!25727 (array!69255) Bool)

(assert (=> start!95464 (and (array_inv!25727 _values!874) e!616437)))

(declare-fun b!1078134 () Bool)

(assert (=> b!1078134 (= e!616436 tp_is_empty!26151)))

(declare-fun mapIsEmpty!40975 () Bool)

(assert (=> mapIsEmpty!40975 mapRes!40975))

(declare-fun b!1078135 () Bool)

(declare-fun res!718388 () Bool)

(assert (=> b!1078135 (=> (not res!718388) (not e!616439))))

(assert (=> b!1078135 (= res!718388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414))))

(assert (= (and start!95464 res!718382) b!1078131))

(assert (= (and b!1078131 res!718383) b!1078129))

(assert (= (and b!1078129 res!718389) b!1078128))

(assert (= (and b!1078128 res!718386) b!1078132))

(assert (= (and b!1078132 res!718385) b!1078122))

(assert (= (and b!1078122 res!718381) b!1078130))

(assert (= (and b!1078130 res!718380) b!1078135))

(assert (= (and b!1078135 res!718388) b!1078125))

(assert (= (and b!1078125 res!718387) b!1078126))

(assert (= (and b!1078126 res!718379) b!1078127))

(assert (= (and b!1078127 (not res!718384)) b!1078124))

(assert (= (and b!1078123 condMapEmpty!40975) mapIsEmpty!40975))

(assert (= (and b!1078123 (not condMapEmpty!40975)) mapNonEmpty!40975))

(get-info :version)

(assert (= (and mapNonEmpty!40975 ((_ is ValueCellFull!12366) mapValue!40975)) b!1078133))

(assert (= (and b!1078123 ((_ is ValueCellFull!12366) mapDefault!40975)) b!1078134))

(assert (= start!95464 b!1078123))

(declare-fun m!996719 () Bool)

(assert (=> b!1078130 m!996719))

(declare-fun m!996721 () Bool)

(assert (=> b!1078127 m!996721))

(declare-fun m!996723 () Bool)

(assert (=> b!1078129 m!996723))

(declare-fun m!996725 () Bool)

(assert (=> start!95464 m!996725))

(declare-fun m!996727 () Bool)

(assert (=> start!95464 m!996727))

(declare-fun m!996729 () Bool)

(assert (=> start!95464 m!996729))

(declare-fun m!996731 () Bool)

(assert (=> b!1078124 m!996731))

(declare-fun m!996733 () Bool)

(assert (=> b!1078126 m!996733))

(declare-fun m!996735 () Bool)

(assert (=> mapNonEmpty!40975 m!996735))

(declare-fun m!996737 () Bool)

(assert (=> b!1078128 m!996737))

(declare-fun m!996739 () Bool)

(assert (=> b!1078122 m!996739))

(declare-fun m!996741 () Bool)

(assert (=> b!1078135 m!996741))

(declare-fun m!996743 () Bool)

(assert (=> b!1078135 m!996743))

(check-sat tp_is_empty!26151 (not b!1078124) (not b!1078129) (not b!1078127) (not b!1078126) (not start!95464) (not b!1078128) (not b!1078135) (not b!1078122) (not mapNonEmpty!40975))
(check-sat)
(get-model)

(declare-fun d!129897 () Bool)

(declare-fun lt!478584 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!536 (List!23231) (InoxSet (_ BitVec 64)))

(assert (=> d!129897 (= lt!478584 (select (content!536 Nil!23228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616462 () Bool)

(assert (=> d!129897 (= lt!478584 e!616462)))

(declare-fun res!718427 () Bool)

(assert (=> d!129897 (=> (not res!718427) (not e!616462))))

(assert (=> d!129897 (= res!718427 ((_ is Cons!23227) Nil!23228))))

(assert (=> d!129897 (= (contains!6372 Nil!23228 #b1000000000000000000000000000000000000000000000000000000000000000) lt!478584)))

(declare-fun b!1078182 () Bool)

(declare-fun e!616463 () Bool)

(assert (=> b!1078182 (= e!616462 e!616463)))

(declare-fun res!718428 () Bool)

(assert (=> b!1078182 (=> res!718428 e!616463)))

(assert (=> b!1078182 (= res!718428 (= (h!24436 Nil!23228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078183 () Bool)

(assert (=> b!1078183 (= e!616463 (contains!6372 (t!32590 Nil!23228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129897 res!718427) b!1078182))

(assert (= (and b!1078182 (not res!718428)) b!1078183))

(declare-fun m!996771 () Bool)

(assert (=> d!129897 m!996771))

(declare-fun m!996773 () Bool)

(assert (=> d!129897 m!996773))

(declare-fun m!996775 () Bool)

(assert (=> b!1078183 m!996775))

(assert (=> b!1078124 d!129897))

(declare-fun b!1078192 () Bool)

(declare-fun e!616472 () Bool)

(declare-fun e!616471 () Bool)

(assert (=> b!1078192 (= e!616472 e!616471)))

(declare-fun c!108330 () Bool)

(assert (=> b!1078192 (= c!108330 (validKeyInArray!0 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45733 () Bool)

(declare-fun call!45736 () Bool)

(assert (=> bm!45733 (= call!45736 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1078193 () Bool)

(declare-fun e!616470 () Bool)

(assert (=> b!1078193 (= e!616471 e!616470)))

(declare-fun lt!478593 () (_ BitVec 64))

(assert (=> b!1078193 (= lt!478593 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35464 0))(
  ( (Unit!35465) )
))
(declare-fun lt!478592 () Unit!35464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69257 (_ BitVec 64) (_ BitVec 32)) Unit!35464)

(assert (=> b!1078193 (= lt!478592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478593 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078193 (arrayContainsKey!0 _keys!1070 lt!478593 #b00000000000000000000000000000000)))

(declare-fun lt!478591 () Unit!35464)

(assert (=> b!1078193 (= lt!478591 lt!478592)))

(declare-fun res!718434 () Bool)

(declare-datatypes ((SeekEntryResult!9902 0))(
  ( (MissingZero!9902 (index!41979 (_ BitVec 32))) (Found!9902 (index!41980 (_ BitVec 32))) (Intermediate!9902 (undefined!10714 Bool) (index!41981 (_ BitVec 32)) (x!96645 (_ BitVec 32))) (Undefined!9902) (MissingVacant!9902 (index!41982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69257 (_ BitVec 32)) SeekEntryResult!9902)

(assert (=> b!1078193 (= res!718434 (= (seekEntryOrOpen!0 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1078193 (=> (not res!718434) (not e!616470))))

(declare-fun b!1078194 () Bool)

(assert (=> b!1078194 (= e!616470 call!45736)))

(declare-fun b!1078195 () Bool)

(assert (=> b!1078195 (= e!616471 call!45736)))

(declare-fun d!129899 () Bool)

(declare-fun res!718433 () Bool)

(assert (=> d!129899 (=> res!718433 e!616472)))

(assert (=> d!129899 (= res!718433 (bvsge #b00000000000000000000000000000000 (size!33840 _keys!1070)))))

(assert (=> d!129899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616472)))

(assert (= (and d!129899 (not res!718433)) b!1078192))

(assert (= (and b!1078192 c!108330) b!1078193))

(assert (= (and b!1078192 (not c!108330)) b!1078195))

(assert (= (and b!1078193 res!718434) b!1078194))

(assert (= (or b!1078194 b!1078195) bm!45733))

(declare-fun m!996777 () Bool)

(assert (=> b!1078192 m!996777))

(assert (=> b!1078192 m!996777))

(declare-fun m!996779 () Bool)

(assert (=> b!1078192 m!996779))

(declare-fun m!996781 () Bool)

(assert (=> bm!45733 m!996781))

(assert (=> b!1078193 m!996777))

(declare-fun m!996783 () Bool)

(assert (=> b!1078193 m!996783))

(declare-fun m!996785 () Bool)

(assert (=> b!1078193 m!996785))

(assert (=> b!1078193 m!996777))

(declare-fun m!996787 () Bool)

(assert (=> b!1078193 m!996787))

(assert (=> b!1078129 d!129899))

(declare-fun d!129901 () Bool)

(assert (=> d!129901 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95464 d!129901))

(declare-fun d!129903 () Bool)

(assert (=> d!129903 (= (array_inv!25726 _keys!1070) (bvsge (size!33840 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95464 d!129903))

(declare-fun d!129905 () Bool)

(assert (=> d!129905 (= (array_inv!25727 _values!874) (bvsge (size!33839 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95464 d!129905))

(declare-fun d!129907 () Bool)

(declare-fun lt!478594 () Bool)

(assert (=> d!129907 (= lt!478594 (select (content!536 Nil!23228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616473 () Bool)

(assert (=> d!129907 (= lt!478594 e!616473)))

(declare-fun res!718435 () Bool)

(assert (=> d!129907 (=> (not res!718435) (not e!616473))))

(assert (=> d!129907 (= res!718435 ((_ is Cons!23227) Nil!23228))))

(assert (=> d!129907 (= (contains!6372 Nil!23228 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478594)))

(declare-fun b!1078196 () Bool)

(declare-fun e!616474 () Bool)

(assert (=> b!1078196 (= e!616473 e!616474)))

(declare-fun res!718436 () Bool)

(assert (=> b!1078196 (=> res!718436 e!616474)))

(assert (=> b!1078196 (= res!718436 (= (h!24436 Nil!23228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078197 () Bool)

(assert (=> b!1078197 (= e!616474 (contains!6372 (t!32590 Nil!23228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129907 res!718435) b!1078196))

(assert (= (and b!1078196 (not res!718436)) b!1078197))

(assert (=> d!129907 m!996771))

(declare-fun m!996789 () Bool)

(assert (=> d!129907 m!996789))

(declare-fun m!996791 () Bool)

(assert (=> b!1078197 m!996791))

(assert (=> b!1078127 d!129907))

(declare-fun d!129909 () Bool)

(declare-fun res!718441 () Bool)

(declare-fun e!616479 () Bool)

(assert (=> d!129909 (=> res!718441 e!616479)))

(assert (=> d!129909 (= res!718441 ((_ is Nil!23228) Nil!23228))))

(assert (=> d!129909 (= (noDuplicate!1579 Nil!23228) e!616479)))

(declare-fun b!1078202 () Bool)

(declare-fun e!616480 () Bool)

(assert (=> b!1078202 (= e!616479 e!616480)))

(declare-fun res!718442 () Bool)

(assert (=> b!1078202 (=> (not res!718442) (not e!616480))))

(assert (=> b!1078202 (= res!718442 (not (contains!6372 (t!32590 Nil!23228) (h!24436 Nil!23228))))))

(declare-fun b!1078203 () Bool)

(assert (=> b!1078203 (= e!616480 (noDuplicate!1579 (t!32590 Nil!23228)))))

(assert (= (and d!129909 (not res!718441)) b!1078202))

(assert (= (and b!1078202 res!718442) b!1078203))

(declare-fun m!996793 () Bool)

(assert (=> b!1078202 m!996793))

(declare-fun m!996795 () Bool)

(assert (=> b!1078203 m!996795))

(assert (=> b!1078126 d!129909))

(declare-fun b!1078204 () Bool)

(declare-fun e!616483 () Bool)

(declare-fun e!616482 () Bool)

(assert (=> b!1078204 (= e!616483 e!616482)))

(declare-fun c!108331 () Bool)

(assert (=> b!1078204 (= c!108331 (validKeyInArray!0 (select (arr!33304 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun call!45737 () Bool)

(declare-fun bm!45734 () Bool)

(assert (=> bm!45734 (= call!45737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414))))

(declare-fun b!1078205 () Bool)

(declare-fun e!616481 () Bool)

(assert (=> b!1078205 (= e!616482 e!616481)))

(declare-fun lt!478597 () (_ BitVec 64))

(assert (=> b!1078205 (= lt!478597 (select (arr!33304 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!478596 () Unit!35464)

(assert (=> b!1078205 (= lt!478596 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) lt!478597 #b00000000000000000000000000000000))))

(assert (=> b!1078205 (arrayContainsKey!0 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) lt!478597 #b00000000000000000000000000000000)))

(declare-fun lt!478595 () Unit!35464)

(assert (=> b!1078205 (= lt!478595 lt!478596)))

(declare-fun res!718444 () Bool)

(assert (=> b!1078205 (= res!718444 (= (seekEntryOrOpen!0 (select (arr!33304 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070))) #b00000000000000000000000000000000) (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1078205 (=> (not res!718444) (not e!616481))))

(declare-fun b!1078206 () Bool)

(assert (=> b!1078206 (= e!616481 call!45737)))

(declare-fun b!1078207 () Bool)

(assert (=> b!1078207 (= e!616482 call!45737)))

(declare-fun d!129911 () Bool)

(declare-fun res!718443 () Bool)

(assert (=> d!129911 (=> res!718443 e!616483)))

(assert (=> d!129911 (= res!718443 (bvsge #b00000000000000000000000000000000 (size!33840 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)))))))

(assert (=> d!129911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69258 (store (arr!33304 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33840 _keys!1070)) mask!1414) e!616483)))

(assert (= (and d!129911 (not res!718443)) b!1078204))

(assert (= (and b!1078204 c!108331) b!1078205))

(assert (= (and b!1078204 (not c!108331)) b!1078207))

(assert (= (and b!1078205 res!718444) b!1078206))

(assert (= (or b!1078206 b!1078207) bm!45734))

(declare-fun m!996797 () Bool)

(assert (=> b!1078204 m!996797))

(assert (=> b!1078204 m!996797))

(declare-fun m!996799 () Bool)

(assert (=> b!1078204 m!996799))

(declare-fun m!996801 () Bool)

(assert (=> bm!45734 m!996801))

(assert (=> b!1078205 m!996797))

(declare-fun m!996803 () Bool)

(assert (=> b!1078205 m!996803))

(declare-fun m!996805 () Bool)

(assert (=> b!1078205 m!996805))

(assert (=> b!1078205 m!996797))

(declare-fun m!996807 () Bool)

(assert (=> b!1078205 m!996807))

(assert (=> b!1078135 d!129911))

(declare-fun b!1078218 () Bool)

(declare-fun e!616492 () Bool)

(declare-fun e!616495 () Bool)

(assert (=> b!1078218 (= e!616492 e!616495)))

(declare-fun res!718451 () Bool)

(assert (=> b!1078218 (=> (not res!718451) (not e!616495))))

(declare-fun e!616493 () Bool)

(assert (=> b!1078218 (= res!718451 (not e!616493))))

(declare-fun res!718453 () Bool)

(assert (=> b!1078218 (=> (not res!718453) (not e!616493))))

(assert (=> b!1078218 (= res!718453 (validKeyInArray!0 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!129913 () Bool)

(declare-fun res!718452 () Bool)

(assert (=> d!129913 (=> res!718452 e!616492)))

(assert (=> d!129913 (= res!718452 (bvsge #b00000000000000000000000000000000 (size!33840 _keys!1070)))))

(assert (=> d!129913 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23228) e!616492)))

(declare-fun b!1078219 () Bool)

(declare-fun e!616494 () Bool)

(assert (=> b!1078219 (= e!616495 e!616494)))

(declare-fun c!108334 () Bool)

(assert (=> b!1078219 (= c!108334 (validKeyInArray!0 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078220 () Bool)

(declare-fun call!45740 () Bool)

(assert (=> b!1078220 (= e!616494 call!45740)))

(declare-fun b!1078221 () Bool)

(assert (=> b!1078221 (= e!616494 call!45740)))

(declare-fun b!1078222 () Bool)

(assert (=> b!1078222 (= e!616493 (contains!6372 Nil!23228 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45737 () Bool)

(assert (=> bm!45737 (= call!45740 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108334 (Cons!23227 (select (arr!33304 _keys!1070) #b00000000000000000000000000000000) Nil!23228) Nil!23228)))))

(assert (= (and d!129913 (not res!718452)) b!1078218))

(assert (= (and b!1078218 res!718453) b!1078222))

(assert (= (and b!1078218 res!718451) b!1078219))

(assert (= (and b!1078219 c!108334) b!1078221))

(assert (= (and b!1078219 (not c!108334)) b!1078220))

(assert (= (or b!1078221 b!1078220) bm!45737))

(assert (=> b!1078218 m!996777))

(assert (=> b!1078218 m!996777))

(assert (=> b!1078218 m!996779))

(assert (=> b!1078219 m!996777))

(assert (=> b!1078219 m!996777))

(assert (=> b!1078219 m!996779))

(assert (=> b!1078222 m!996777))

(assert (=> b!1078222 m!996777))

(declare-fun m!996809 () Bool)

(assert (=> b!1078222 m!996809))

(assert (=> bm!45737 m!996777))

(declare-fun m!996811 () Bool)

(assert (=> bm!45737 m!996811))

(assert (=> b!1078128 d!129913))

(declare-fun d!129915 () Bool)

(assert (=> d!129915 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1078122 d!129915))

(declare-fun mapIsEmpty!40981 () Bool)

(declare-fun mapRes!40981 () Bool)

(assert (=> mapIsEmpty!40981 mapRes!40981))

(declare-fun condMapEmpty!40981 () Bool)

(declare-fun mapDefault!40981 () ValueCell!12366)

(assert (=> mapNonEmpty!40975 (= condMapEmpty!40981 (= mapRest!40975 ((as const (Array (_ BitVec 32) ValueCell!12366)) mapDefault!40981)))))

(declare-fun e!616500 () Bool)

(assert (=> mapNonEmpty!40975 (= tp!78437 (and e!616500 mapRes!40981))))

(declare-fun b!1078229 () Bool)

(declare-fun e!616501 () Bool)

(assert (=> b!1078229 (= e!616501 tp_is_empty!26151)))

(declare-fun b!1078230 () Bool)

(assert (=> b!1078230 (= e!616500 tp_is_empty!26151)))

(declare-fun mapNonEmpty!40981 () Bool)

(declare-fun tp!78443 () Bool)

(assert (=> mapNonEmpty!40981 (= mapRes!40981 (and tp!78443 e!616501))))

(declare-fun mapValue!40981 () ValueCell!12366)

(declare-fun mapKey!40981 () (_ BitVec 32))

(declare-fun mapRest!40981 () (Array (_ BitVec 32) ValueCell!12366))

(assert (=> mapNonEmpty!40981 (= mapRest!40975 (store mapRest!40981 mapKey!40981 mapValue!40981))))

(assert (= (and mapNonEmpty!40975 condMapEmpty!40981) mapIsEmpty!40981))

(assert (= (and mapNonEmpty!40975 (not condMapEmpty!40981)) mapNonEmpty!40981))

(assert (= (and mapNonEmpty!40981 ((_ is ValueCellFull!12366) mapValue!40981)) b!1078229))

(assert (= (and mapNonEmpty!40975 ((_ is ValueCellFull!12366) mapDefault!40981)) b!1078230))

(declare-fun m!996813 () Bool)

(assert (=> mapNonEmpty!40981 m!996813))

(check-sat (not b!1078197) tp_is_empty!26151 (not bm!45737) (not b!1078218) (not b!1078205) (not b!1078219) (not bm!45733) (not b!1078204) (not b!1078222) (not d!129907) (not b!1078192) (not b!1078203) (not b!1078202) (not d!129897) (not bm!45734) (not b!1078193) (not mapNonEmpty!40981) (not b!1078183))
(check-sat)
