; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95160 () Bool)

(assert start!95160)

(declare-fun b_free!22129 () Bool)

(declare-fun b_next!22129 () Bool)

(assert (=> start!95160 (= b_free!22129 (not b_next!22129))))

(declare-fun tp!77851 () Bool)

(declare-fun b_and!34993 () Bool)

(assert (=> start!95160 (= tp!77851 b_and!34993)))

(declare-fun b!1074627 () Bool)

(declare-fun e!614014 () Bool)

(assert (=> b!1074627 (= e!614014 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39721 0))(
  ( (V!39722 (val!13020 Int)) )
))
(declare-fun minValue!907 () V!39721)

(declare-datatypes ((array!68889 0))(
  ( (array!68890 (arr!33132 (Array (_ BitVec 32) (_ BitVec 64))) (size!33669 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68889)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12266 0))(
  ( (ValueCellFull!12266 (v!15634 V!39721)) (EmptyCell!12266) )
))
(declare-datatypes ((array!68891 0))(
  ( (array!68892 (arr!33133 (Array (_ BitVec 32) ValueCell!12266)) (size!33670 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68891)

(declare-datatypes ((tuple2!16564 0))(
  ( (tuple2!16565 (_1!8293 (_ BitVec 64)) (_2!8293 V!39721)) )
))
(declare-datatypes ((List!23122 0))(
  ( (Nil!23119) (Cons!23118 (h!24336 tuple2!16564) (t!32451 List!23122)) )
))
(declare-datatypes ((ListLongMap!14541 0))(
  ( (ListLongMap!14542 (toList!7286 List!23122)) )
))
(declare-fun lt!476523 () ListLongMap!14541)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39721)

(declare-fun getCurrentListMapNoExtraKeys!3884 (array!68889 array!68891 (_ BitVec 32) (_ BitVec 32) V!39721 V!39721 (_ BitVec 32) Int) ListLongMap!14541)

(assert (=> b!1074627 (= lt!476523 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39721)

(declare-fun lt!476522 () ListLongMap!14541)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074627 (= lt!476522 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074628 () Bool)

(declare-fun res!716384 () Bool)

(assert (=> b!1074628 (=> (not res!716384) (not e!614014))))

(assert (=> b!1074628 (= res!716384 (and (= (size!33670 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33669 _keys!1163) (size!33670 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!716386 () Bool)

(assert (=> start!95160 (=> (not res!716386) (not e!614014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95160 (= res!716386 (validMask!0 mask!1515))))

(assert (=> start!95160 e!614014))

(assert (=> start!95160 true))

(declare-fun tp_is_empty!25939 () Bool)

(assert (=> start!95160 tp_is_empty!25939))

(declare-fun e!614015 () Bool)

(declare-fun array_inv!25648 (array!68891) Bool)

(assert (=> start!95160 (and (array_inv!25648 _values!955) e!614015)))

(assert (=> start!95160 tp!77851))

(declare-fun array_inv!25649 (array!68889) Bool)

(assert (=> start!95160 (array_inv!25649 _keys!1163)))

(declare-fun b!1074629 () Bool)

(declare-fun e!614017 () Bool)

(assert (=> b!1074629 (= e!614017 tp_is_empty!25939)))

(declare-fun mapIsEmpty!40621 () Bool)

(declare-fun mapRes!40621 () Bool)

(assert (=> mapIsEmpty!40621 mapRes!40621))

(declare-fun mapNonEmpty!40621 () Bool)

(declare-fun tp!77852 () Bool)

(assert (=> mapNonEmpty!40621 (= mapRes!40621 (and tp!77852 e!614017))))

(declare-fun mapKey!40621 () (_ BitVec 32))

(declare-fun mapValue!40621 () ValueCell!12266)

(declare-fun mapRest!40621 () (Array (_ BitVec 32) ValueCell!12266))

(assert (=> mapNonEmpty!40621 (= (arr!33133 _values!955) (store mapRest!40621 mapKey!40621 mapValue!40621))))

(declare-fun b!1074630 () Bool)

(declare-fun e!614016 () Bool)

(assert (=> b!1074630 (= e!614016 tp_is_empty!25939)))

(declare-fun b!1074631 () Bool)

(assert (=> b!1074631 (= e!614015 (and e!614016 mapRes!40621))))

(declare-fun condMapEmpty!40621 () Bool)

(declare-fun mapDefault!40621 () ValueCell!12266)

(assert (=> b!1074631 (= condMapEmpty!40621 (= (arr!33133 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12266)) mapDefault!40621)))))

(declare-fun b!1074632 () Bool)

(declare-fun res!716383 () Bool)

(assert (=> b!1074632 (=> (not res!716383) (not e!614014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68889 (_ BitVec 32)) Bool)

(assert (=> b!1074632 (= res!716383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074633 () Bool)

(declare-fun res!716385 () Bool)

(assert (=> b!1074633 (=> (not res!716385) (not e!614014))))

(declare-datatypes ((List!23123 0))(
  ( (Nil!23120) (Cons!23119 (h!24337 (_ BitVec 64)) (t!32452 List!23123)) )
))
(declare-fun arrayNoDuplicates!0 (array!68889 (_ BitVec 32) List!23123) Bool)

(assert (=> b!1074633 (= res!716385 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23120))))

(assert (= (and start!95160 res!716386) b!1074628))

(assert (= (and b!1074628 res!716384) b!1074632))

(assert (= (and b!1074632 res!716383) b!1074633))

(assert (= (and b!1074633 res!716385) b!1074627))

(assert (= (and b!1074631 condMapEmpty!40621) mapIsEmpty!40621))

(assert (= (and b!1074631 (not condMapEmpty!40621)) mapNonEmpty!40621))

(get-info :version)

(assert (= (and mapNonEmpty!40621 ((_ is ValueCellFull!12266) mapValue!40621)) b!1074629))

(assert (= (and b!1074631 ((_ is ValueCellFull!12266) mapDefault!40621)) b!1074630))

(assert (= start!95160 b!1074631))

(declare-fun m!993991 () Bool)

(assert (=> start!95160 m!993991))

(declare-fun m!993993 () Bool)

(assert (=> start!95160 m!993993))

(declare-fun m!993995 () Bool)

(assert (=> start!95160 m!993995))

(declare-fun m!993997 () Bool)

(assert (=> b!1074633 m!993997))

(declare-fun m!993999 () Bool)

(assert (=> b!1074627 m!993999))

(declare-fun m!994001 () Bool)

(assert (=> b!1074627 m!994001))

(declare-fun m!994003 () Bool)

(assert (=> b!1074632 m!994003))

(declare-fun m!994005 () Bool)

(assert (=> mapNonEmpty!40621 m!994005))

(check-sat (not b!1074632) tp_is_empty!25939 (not start!95160) (not mapNonEmpty!40621) (not b!1074633) b_and!34993 (not b_next!22129) (not b!1074627))
(check-sat b_and!34993 (not b_next!22129))
