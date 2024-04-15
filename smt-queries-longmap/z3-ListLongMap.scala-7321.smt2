; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93564 () Bool)

(assert start!93564)

(declare-fun b!1058852 () Bool)

(declare-fun e!602548 () Bool)

(declare-fun e!602547 () Bool)

(declare-fun mapRes!39022 () Bool)

(assert (=> b!1058852 (= e!602548 (and e!602547 mapRes!39022))))

(declare-fun condMapEmpty!39022 () Bool)

(declare-datatypes ((V!38353 0))(
  ( (V!38354 (val!12507 Int)) )
))
(declare-datatypes ((ValueCell!11753 0))(
  ( (ValueCellFull!11753 (v!15115 V!38353)) (EmptyCell!11753) )
))
(declare-datatypes ((array!66788 0))(
  ( (array!66789 (arr!32108 (Array (_ BitVec 32) ValueCell!11753)) (size!32646 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66788)

(declare-fun mapDefault!39022 () ValueCell!11753)

(assert (=> b!1058852 (= condMapEmpty!39022 (= (arr!32108 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11753)) mapDefault!39022)))))

(declare-fun b!1058853 () Bool)

(declare-fun res!707425 () Bool)

(declare-fun e!602549 () Bool)

(assert (=> b!1058853 (=> (not res!707425) (not e!602549))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66790 0))(
  ( (array!66791 (arr!32109 (Array (_ BitVec 32) (_ BitVec 64))) (size!32647 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66790)

(assert (=> b!1058853 (= res!707425 (and (= (size!32646 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32647 _keys!1163) (size!32646 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1058854 () Bool)

(assert (=> b!1058854 (= e!602549 (bvsgt #b00000000000000000000000000000000 (size!32647 _keys!1163)))))

(declare-fun b!1058855 () Bool)

(declare-fun e!602551 () Bool)

(declare-fun tp_is_empty!24913 () Bool)

(assert (=> b!1058855 (= e!602551 tp_is_empty!24913)))

(declare-fun res!707424 () Bool)

(assert (=> start!93564 (=> (not res!707424) (not e!602549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93564 (= res!707424 (validMask!0 mask!1515))))

(assert (=> start!93564 e!602549))

(assert (=> start!93564 true))

(declare-fun array_inv!24890 (array!66788) Bool)

(assert (=> start!93564 (and (array_inv!24890 _values!955) e!602548)))

(declare-fun array_inv!24891 (array!66790) Bool)

(assert (=> start!93564 (array_inv!24891 _keys!1163)))

(declare-fun b!1058856 () Bool)

(assert (=> b!1058856 (= e!602547 tp_is_empty!24913)))

(declare-fun mapIsEmpty!39022 () Bool)

(assert (=> mapIsEmpty!39022 mapRes!39022))

(declare-fun b!1058857 () Bool)

(declare-fun res!707426 () Bool)

(assert (=> b!1058857 (=> (not res!707426) (not e!602549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66790 (_ BitVec 32)) Bool)

(assert (=> b!1058857 (= res!707426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39022 () Bool)

(declare-fun tp!74828 () Bool)

(assert (=> mapNonEmpty!39022 (= mapRes!39022 (and tp!74828 e!602551))))

(declare-fun mapValue!39022 () ValueCell!11753)

(declare-fun mapKey!39022 () (_ BitVec 32))

(declare-fun mapRest!39022 () (Array (_ BitVec 32) ValueCell!11753))

(assert (=> mapNonEmpty!39022 (= (arr!32108 _values!955) (store mapRest!39022 mapKey!39022 mapValue!39022))))

(assert (= (and start!93564 res!707424) b!1058853))

(assert (= (and b!1058853 res!707425) b!1058857))

(assert (= (and b!1058857 res!707426) b!1058854))

(assert (= (and b!1058852 condMapEmpty!39022) mapIsEmpty!39022))

(assert (= (and b!1058852 (not condMapEmpty!39022)) mapNonEmpty!39022))

(get-info :version)

(assert (= (and mapNonEmpty!39022 ((_ is ValueCellFull!11753) mapValue!39022)) b!1058855))

(assert (= (and b!1058852 ((_ is ValueCellFull!11753) mapDefault!39022)) b!1058856))

(assert (= start!93564 b!1058852))

(declare-fun m!977967 () Bool)

(assert (=> start!93564 m!977967))

(declare-fun m!977969 () Bool)

(assert (=> start!93564 m!977969))

(declare-fun m!977971 () Bool)

(assert (=> start!93564 m!977971))

(declare-fun m!977973 () Bool)

(assert (=> b!1058857 m!977973))

(declare-fun m!977975 () Bool)

(assert (=> mapNonEmpty!39022 m!977975))

(check-sat (not b!1058857) (not start!93564) (not mapNonEmpty!39022) tp_is_empty!24913)
(check-sat)
(get-model)

(declare-fun b!1058902 () Bool)

(declare-fun e!602589 () Bool)

(declare-fun call!44852 () Bool)

(assert (=> b!1058902 (= e!602589 call!44852)))

(declare-fun b!1058903 () Bool)

(declare-fun e!602588 () Bool)

(assert (=> b!1058903 (= e!602589 e!602588)))

(declare-fun lt!466876 () (_ BitVec 64))

(assert (=> b!1058903 (= lt!466876 (select (arr!32109 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34589 0))(
  ( (Unit!34590) )
))
(declare-fun lt!466874 () Unit!34589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66790 (_ BitVec 64) (_ BitVec 32)) Unit!34589)

(assert (=> b!1058903 (= lt!466874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!466876 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058903 (arrayContainsKey!0 _keys!1163 lt!466876 #b00000000000000000000000000000000)))

(declare-fun lt!466875 () Unit!34589)

(assert (=> b!1058903 (= lt!466875 lt!466874)))

(declare-fun res!707450 () Bool)

(declare-datatypes ((SeekEntryResult!9864 0))(
  ( (MissingZero!9864 (index!41827 (_ BitVec 32))) (Found!9864 (index!41828 (_ BitVec 32))) (Intermediate!9864 (undefined!10676 Bool) (index!41829 (_ BitVec 32)) (x!94618 (_ BitVec 32))) (Undefined!9864) (MissingVacant!9864 (index!41830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66790 (_ BitVec 32)) SeekEntryResult!9864)

(assert (=> b!1058903 (= res!707450 (= (seekEntryOrOpen!0 (select (arr!32109 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9864 #b00000000000000000000000000000000)))))

(assert (=> b!1058903 (=> (not res!707450) (not e!602588))))

(declare-fun b!1058904 () Bool)

(declare-fun e!602590 () Bool)

(assert (=> b!1058904 (= e!602590 e!602589)))

(declare-fun c!107145 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058904 (= c!107145 (validKeyInArray!0 (select (arr!32109 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128527 () Bool)

(declare-fun res!707449 () Bool)

(assert (=> d!128527 (=> res!707449 e!602590)))

(assert (=> d!128527 (= res!707449 (bvsge #b00000000000000000000000000000000 (size!32647 _keys!1163)))))

(assert (=> d!128527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602590)))

(declare-fun b!1058905 () Bool)

(assert (=> b!1058905 (= e!602588 call!44852)))

(declare-fun bm!44849 () Bool)

(assert (=> bm!44849 (= call!44852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128527 (not res!707449)) b!1058904))

(assert (= (and b!1058904 c!107145) b!1058903))

(assert (= (and b!1058904 (not c!107145)) b!1058902))

(assert (= (and b!1058903 res!707450) b!1058905))

(assert (= (or b!1058905 b!1058902) bm!44849))

(declare-fun m!977997 () Bool)

(assert (=> b!1058903 m!977997))

(declare-fun m!977999 () Bool)

(assert (=> b!1058903 m!977999))

(declare-fun m!978001 () Bool)

(assert (=> b!1058903 m!978001))

(assert (=> b!1058903 m!977997))

(declare-fun m!978003 () Bool)

(assert (=> b!1058903 m!978003))

(assert (=> b!1058904 m!977997))

(assert (=> b!1058904 m!977997))

(declare-fun m!978005 () Bool)

(assert (=> b!1058904 m!978005))

(declare-fun m!978007 () Bool)

(assert (=> bm!44849 m!978007))

(assert (=> b!1058857 d!128527))

(declare-fun d!128529 () Bool)

(assert (=> d!128529 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93564 d!128529))

(declare-fun d!128531 () Bool)

(assert (=> d!128531 (= (array_inv!24890 _values!955) (bvsge (size!32646 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93564 d!128531))

(declare-fun d!128533 () Bool)

(assert (=> d!128533 (= (array_inv!24891 _keys!1163) (bvsge (size!32647 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93564 d!128533))

(declare-fun condMapEmpty!39031 () Bool)

(declare-fun mapDefault!39031 () ValueCell!11753)

(assert (=> mapNonEmpty!39022 (= condMapEmpty!39031 (= mapRest!39022 ((as const (Array (_ BitVec 32) ValueCell!11753)) mapDefault!39031)))))

(declare-fun e!602596 () Bool)

(declare-fun mapRes!39031 () Bool)

(assert (=> mapNonEmpty!39022 (= tp!74828 (and e!602596 mapRes!39031))))

(declare-fun mapNonEmpty!39031 () Bool)

(declare-fun tp!74837 () Bool)

(declare-fun e!602595 () Bool)

(assert (=> mapNonEmpty!39031 (= mapRes!39031 (and tp!74837 e!602595))))

(declare-fun mapRest!39031 () (Array (_ BitVec 32) ValueCell!11753))

(declare-fun mapValue!39031 () ValueCell!11753)

(declare-fun mapKey!39031 () (_ BitVec 32))

(assert (=> mapNonEmpty!39031 (= mapRest!39022 (store mapRest!39031 mapKey!39031 mapValue!39031))))

(declare-fun b!1058912 () Bool)

(assert (=> b!1058912 (= e!602595 tp_is_empty!24913)))

(declare-fun b!1058913 () Bool)

(assert (=> b!1058913 (= e!602596 tp_is_empty!24913)))

(declare-fun mapIsEmpty!39031 () Bool)

(assert (=> mapIsEmpty!39031 mapRes!39031))

(assert (= (and mapNonEmpty!39022 condMapEmpty!39031) mapIsEmpty!39031))

(assert (= (and mapNonEmpty!39022 (not condMapEmpty!39031)) mapNonEmpty!39031))

(assert (= (and mapNonEmpty!39031 ((_ is ValueCellFull!11753) mapValue!39031)) b!1058912))

(assert (= (and mapNonEmpty!39022 ((_ is ValueCellFull!11753) mapDefault!39031)) b!1058913))

(declare-fun m!978009 () Bool)

(assert (=> mapNonEmpty!39031 m!978009))

(check-sat (not bm!44849) (not b!1058903) (not b!1058904) tp_is_empty!24913 (not mapNonEmpty!39031))
(check-sat)
