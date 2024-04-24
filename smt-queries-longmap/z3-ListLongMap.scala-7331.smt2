; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93904 () Bool)

(assert start!93904)

(declare-fun b!1061008 () Bool)

(declare-fun e!604038 () Bool)

(declare-fun e!604034 () Bool)

(declare-fun mapRes!39124 () Bool)

(assert (=> b!1061008 (= e!604038 (and e!604034 mapRes!39124))))

(declare-fun condMapEmpty!39124 () Bool)

(declare-datatypes ((V!38433 0))(
  ( (V!38434 (val!12537 Int)) )
))
(declare-datatypes ((ValueCell!11783 0))(
  ( (ValueCellFull!11783 (v!15143 V!38433)) (EmptyCell!11783) )
))
(declare-datatypes ((array!67017 0))(
  ( (array!67018 (arr!32212 (Array (_ BitVec 32) ValueCell!11783)) (size!32749 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67017)

(declare-fun mapDefault!39124 () ValueCell!11783)

(assert (=> b!1061008 (= condMapEmpty!39124 (= (arr!32212 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11783)) mapDefault!39124)))))

(declare-fun res!708365 () Bool)

(declare-fun e!604035 () Bool)

(assert (=> start!93904 (=> (not res!708365) (not e!604035))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93904 (= res!708365 (validMask!0 mask!1515))))

(assert (=> start!93904 e!604035))

(assert (=> start!93904 true))

(declare-fun array_inv!24980 (array!67017) Bool)

(assert (=> start!93904 (and (array_inv!24980 _values!955) e!604038)))

(declare-datatypes ((array!67019 0))(
  ( (array!67020 (arr!32213 (Array (_ BitVec 32) (_ BitVec 64))) (size!32750 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67019)

(declare-fun array_inv!24981 (array!67019) Bool)

(assert (=> start!93904 (array_inv!24981 _keys!1163)))

(declare-fun b!1061009 () Bool)

(declare-fun res!708366 () Bool)

(assert (=> b!1061009 (=> (not res!708366) (not e!604035))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061009 (= res!708366 (and (= (size!32749 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32750 _keys!1163) (size!32749 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39124 () Bool)

(declare-fun tp!74930 () Bool)

(declare-fun e!604036 () Bool)

(assert (=> mapNonEmpty!39124 (= mapRes!39124 (and tp!74930 e!604036))))

(declare-fun mapKey!39124 () (_ BitVec 32))

(declare-fun mapValue!39124 () ValueCell!11783)

(declare-fun mapRest!39124 () (Array (_ BitVec 32) ValueCell!11783))

(assert (=> mapNonEmpty!39124 (= (arr!32212 _values!955) (store mapRest!39124 mapKey!39124 mapValue!39124))))

(declare-fun b!1061010 () Bool)

(assert (=> b!1061010 (= e!604035 false)))

(declare-fun lt!467679 () Bool)

(declare-datatypes ((List!22425 0))(
  ( (Nil!22422) (Cons!22421 (h!23639 (_ BitVec 64)) (t!31724 List!22425)) )
))
(declare-fun arrayNoDuplicates!0 (array!67019 (_ BitVec 32) List!22425) Bool)

(assert (=> b!1061010 (= lt!467679 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22422))))

(declare-fun b!1061011 () Bool)

(declare-fun tp_is_empty!24973 () Bool)

(assert (=> b!1061011 (= e!604036 tp_is_empty!24973)))

(declare-fun b!1061012 () Bool)

(assert (=> b!1061012 (= e!604034 tp_is_empty!24973)))

(declare-fun mapIsEmpty!39124 () Bool)

(assert (=> mapIsEmpty!39124 mapRes!39124))

(declare-fun b!1061013 () Bool)

(declare-fun res!708367 () Bool)

(assert (=> b!1061013 (=> (not res!708367) (not e!604035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67019 (_ BitVec 32)) Bool)

(assert (=> b!1061013 (= res!708367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93904 res!708365) b!1061009))

(assert (= (and b!1061009 res!708366) b!1061013))

(assert (= (and b!1061013 res!708367) b!1061010))

(assert (= (and b!1061008 condMapEmpty!39124) mapIsEmpty!39124))

(assert (= (and b!1061008 (not condMapEmpty!39124)) mapNonEmpty!39124))

(get-info :version)

(assert (= (and mapNonEmpty!39124 ((_ is ValueCellFull!11783) mapValue!39124)) b!1061011))

(assert (= (and b!1061008 ((_ is ValueCellFull!11783) mapDefault!39124)) b!1061012))

(assert (= start!93904 b!1061008))

(declare-fun m!980699 () Bool)

(assert (=> start!93904 m!980699))

(declare-fun m!980701 () Bool)

(assert (=> start!93904 m!980701))

(declare-fun m!980703 () Bool)

(assert (=> start!93904 m!980703))

(declare-fun m!980705 () Bool)

(assert (=> mapNonEmpty!39124 m!980705))

(declare-fun m!980707 () Bool)

(assert (=> b!1061010 m!980707))

(declare-fun m!980709 () Bool)

(assert (=> b!1061013 m!980709))

(check-sat (not mapNonEmpty!39124) (not b!1061010) (not start!93904) tp_is_empty!24973 (not b!1061013))
(check-sat)
