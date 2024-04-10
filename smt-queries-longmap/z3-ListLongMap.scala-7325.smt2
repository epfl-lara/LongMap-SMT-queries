; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93634 () Bool)

(assert start!93634)

(declare-fun b!1059375 () Bool)

(declare-fun res!707692 () Bool)

(declare-fun e!602928 () Bool)

(assert (=> b!1059375 (=> (not res!707692) (not e!602928))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38387 0))(
  ( (V!38388 (val!12520 Int)) )
))
(declare-datatypes ((ValueCell!11766 0))(
  ( (ValueCellFull!11766 (v!15130 V!38387)) (EmptyCell!11766) )
))
(declare-datatypes ((array!66909 0))(
  ( (array!66910 (arr!32164 (Array (_ BitVec 32) ValueCell!11766)) (size!32700 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66909)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66911 0))(
  ( (array!66912 (arr!32165 (Array (_ BitVec 32) (_ BitVec 64))) (size!32701 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66911)

(assert (=> b!1059375 (= res!707692 (and (= (size!32700 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32701 _keys!1163) (size!32700 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059376 () Bool)

(declare-fun res!707690 () Bool)

(assert (=> b!1059376 (=> (not res!707690) (not e!602928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66911 (_ BitVec 32)) Bool)

(assert (=> b!1059376 (= res!707690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707691 () Bool)

(assert (=> start!93634 (=> (not res!707691) (not e!602928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93634 (= res!707691 (validMask!0 mask!1515))))

(assert (=> start!93634 e!602928))

(assert (=> start!93634 true))

(declare-fun e!602924 () Bool)

(declare-fun array_inv!24934 (array!66909) Bool)

(assert (=> start!93634 (and (array_inv!24934 _values!955) e!602924)))

(declare-fun array_inv!24935 (array!66911) Bool)

(assert (=> start!93634 (array_inv!24935 _keys!1163)))

(declare-fun b!1059377 () Bool)

(declare-fun e!602925 () Bool)

(declare-fun mapRes!39073 () Bool)

(assert (=> b!1059377 (= e!602924 (and e!602925 mapRes!39073))))

(declare-fun condMapEmpty!39073 () Bool)

(declare-fun mapDefault!39073 () ValueCell!11766)

(assert (=> b!1059377 (= condMapEmpty!39073 (= (arr!32164 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11766)) mapDefault!39073)))))

(declare-fun mapNonEmpty!39073 () Bool)

(declare-fun tp!74879 () Bool)

(declare-fun e!602926 () Bool)

(assert (=> mapNonEmpty!39073 (= mapRes!39073 (and tp!74879 e!602926))))

(declare-fun mapRest!39073 () (Array (_ BitVec 32) ValueCell!11766))

(declare-fun mapKey!39073 () (_ BitVec 32))

(declare-fun mapValue!39073 () ValueCell!11766)

(assert (=> mapNonEmpty!39073 (= (arr!32164 _values!955) (store mapRest!39073 mapKey!39073 mapValue!39073))))

(declare-fun b!1059378 () Bool)

(declare-fun tp_is_empty!24939 () Bool)

(assert (=> b!1059378 (= e!602926 tp_is_empty!24939)))

(declare-fun b!1059379 () Bool)

(assert (=> b!1059379 (= e!602925 tp_is_empty!24939)))

(declare-fun b!1059380 () Bool)

(assert (=> b!1059380 (= e!602928 false)))

(declare-fun lt!467113 () Bool)

(declare-datatypes ((List!22426 0))(
  ( (Nil!22423) (Cons!22422 (h!23631 (_ BitVec 64)) (t!31733 List!22426)) )
))
(declare-fun arrayNoDuplicates!0 (array!66911 (_ BitVec 32) List!22426) Bool)

(assert (=> b!1059380 (= lt!467113 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22423))))

(declare-fun mapIsEmpty!39073 () Bool)

(assert (=> mapIsEmpty!39073 mapRes!39073))

(assert (= (and start!93634 res!707691) b!1059375))

(assert (= (and b!1059375 res!707692) b!1059376))

(assert (= (and b!1059376 res!707690) b!1059380))

(assert (= (and b!1059377 condMapEmpty!39073) mapIsEmpty!39073))

(assert (= (and b!1059377 (not condMapEmpty!39073)) mapNonEmpty!39073))

(get-info :version)

(assert (= (and mapNonEmpty!39073 ((_ is ValueCellFull!11766) mapValue!39073)) b!1059378))

(assert (= (and b!1059377 ((_ is ValueCellFull!11766) mapDefault!39073)) b!1059379))

(assert (= start!93634 b!1059377))

(declare-fun m!978823 () Bool)

(assert (=> b!1059376 m!978823))

(declare-fun m!978825 () Bool)

(assert (=> start!93634 m!978825))

(declare-fun m!978827 () Bool)

(assert (=> start!93634 m!978827))

(declare-fun m!978829 () Bool)

(assert (=> start!93634 m!978829))

(declare-fun m!978831 () Bool)

(assert (=> mapNonEmpty!39073 m!978831))

(declare-fun m!978833 () Bool)

(assert (=> b!1059380 m!978833))

(check-sat (not b!1059376) tp_is_empty!24939 (not mapNonEmpty!39073) (not b!1059380) (not start!93634))
(check-sat)
