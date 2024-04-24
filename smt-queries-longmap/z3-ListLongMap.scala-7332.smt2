; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93910 () Bool)

(assert start!93910)

(declare-fun b!1061062 () Bool)

(declare-fun res!708392 () Bool)

(declare-fun e!604080 () Bool)

(assert (=> b!1061062 (=> (not res!708392) (not e!604080))))

(declare-datatypes ((array!67029 0))(
  ( (array!67030 (arr!32218 (Array (_ BitVec 32) (_ BitVec 64))) (size!32755 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67029)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67029 (_ BitVec 32)) Bool)

(assert (=> b!1061062 (= res!708392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39133 () Bool)

(declare-fun mapRes!39133 () Bool)

(declare-fun tp!74939 () Bool)

(declare-fun e!604083 () Bool)

(assert (=> mapNonEmpty!39133 (= mapRes!39133 (and tp!74939 e!604083))))

(declare-datatypes ((V!38441 0))(
  ( (V!38442 (val!12540 Int)) )
))
(declare-datatypes ((ValueCell!11786 0))(
  ( (ValueCellFull!11786 (v!15146 V!38441)) (EmptyCell!11786) )
))
(declare-fun mapRest!39133 () (Array (_ BitVec 32) ValueCell!11786))

(declare-datatypes ((array!67031 0))(
  ( (array!67032 (arr!32219 (Array (_ BitVec 32) ValueCell!11786)) (size!32756 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67031)

(declare-fun mapKey!39133 () (_ BitVec 32))

(declare-fun mapValue!39133 () ValueCell!11786)

(assert (=> mapNonEmpty!39133 (= (arr!32219 _values!955) (store mapRest!39133 mapKey!39133 mapValue!39133))))

(declare-fun res!708394 () Bool)

(assert (=> start!93910 (=> (not res!708394) (not e!604080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93910 (= res!708394 (validMask!0 mask!1515))))

(assert (=> start!93910 e!604080))

(assert (=> start!93910 true))

(declare-fun e!604079 () Bool)

(declare-fun array_inv!24982 (array!67031) Bool)

(assert (=> start!93910 (and (array_inv!24982 _values!955) e!604079)))

(declare-fun array_inv!24983 (array!67029) Bool)

(assert (=> start!93910 (array_inv!24983 _keys!1163)))

(declare-fun b!1061063 () Bool)

(declare-fun e!604082 () Bool)

(declare-fun tp_is_empty!24979 () Bool)

(assert (=> b!1061063 (= e!604082 tp_is_empty!24979)))

(declare-fun mapIsEmpty!39133 () Bool)

(assert (=> mapIsEmpty!39133 mapRes!39133))

(declare-fun b!1061064 () Bool)

(assert (=> b!1061064 (= e!604080 false)))

(declare-fun lt!467688 () Bool)

(declare-datatypes ((List!22428 0))(
  ( (Nil!22425) (Cons!22424 (h!23642 (_ BitVec 64)) (t!31727 List!22428)) )
))
(declare-fun arrayNoDuplicates!0 (array!67029 (_ BitVec 32) List!22428) Bool)

(assert (=> b!1061064 (= lt!467688 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22425))))

(declare-fun b!1061065 () Bool)

(declare-fun res!708393 () Bool)

(assert (=> b!1061065 (=> (not res!708393) (not e!604080))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061065 (= res!708393 (and (= (size!32756 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32755 _keys!1163) (size!32756 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061066 () Bool)

(assert (=> b!1061066 (= e!604079 (and e!604082 mapRes!39133))))

(declare-fun condMapEmpty!39133 () Bool)

(declare-fun mapDefault!39133 () ValueCell!11786)

(assert (=> b!1061066 (= condMapEmpty!39133 (= (arr!32219 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11786)) mapDefault!39133)))))

(declare-fun b!1061067 () Bool)

(assert (=> b!1061067 (= e!604083 tp_is_empty!24979)))

(assert (= (and start!93910 res!708394) b!1061065))

(assert (= (and b!1061065 res!708393) b!1061062))

(assert (= (and b!1061062 res!708392) b!1061064))

(assert (= (and b!1061066 condMapEmpty!39133) mapIsEmpty!39133))

(assert (= (and b!1061066 (not condMapEmpty!39133)) mapNonEmpty!39133))

(get-info :version)

(assert (= (and mapNonEmpty!39133 ((_ is ValueCellFull!11786) mapValue!39133)) b!1061067))

(assert (= (and b!1061066 ((_ is ValueCellFull!11786) mapDefault!39133)) b!1061063))

(assert (= start!93910 b!1061066))

(declare-fun m!980735 () Bool)

(assert (=> b!1061062 m!980735))

(declare-fun m!980737 () Bool)

(assert (=> mapNonEmpty!39133 m!980737))

(declare-fun m!980739 () Bool)

(assert (=> start!93910 m!980739))

(declare-fun m!980741 () Bool)

(assert (=> start!93910 m!980741))

(declare-fun m!980743 () Bool)

(assert (=> start!93910 m!980743))

(declare-fun m!980745 () Bool)

(assert (=> b!1061064 m!980745))

(check-sat (not b!1061064) (not mapNonEmpty!39133) (not b!1061062) tp_is_empty!24979 (not start!93910))
(check-sat)
