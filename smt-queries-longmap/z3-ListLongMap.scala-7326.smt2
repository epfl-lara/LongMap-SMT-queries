; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93632 () Bool)

(assert start!93632)

(declare-fun mapNonEmpty!39079 () Bool)

(declare-fun mapRes!39079 () Bool)

(declare-fun tp!74885 () Bool)

(declare-fun e!602863 () Bool)

(assert (=> mapNonEmpty!39079 (= mapRes!39079 (and tp!74885 e!602863))))

(declare-fun mapKey!39079 () (_ BitVec 32))

(declare-datatypes ((V!38393 0))(
  ( (V!38394 (val!12522 Int)) )
))
(declare-datatypes ((ValueCell!11768 0))(
  ( (ValueCellFull!11768 (v!15131 V!38393)) (EmptyCell!11768) )
))
(declare-datatypes ((array!66856 0))(
  ( (array!66857 (arr!32138 (Array (_ BitVec 32) ValueCell!11768)) (size!32676 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66856)

(declare-fun mapValue!39079 () ValueCell!11768)

(declare-fun mapRest!39079 () (Array (_ BitVec 32) ValueCell!11768))

(assert (=> mapNonEmpty!39079 (= (arr!32138 _values!955) (store mapRest!39079 mapKey!39079 mapValue!39079))))

(declare-fun b!1059258 () Bool)

(declare-fun tp_is_empty!24943 () Bool)

(assert (=> b!1059258 (= e!602863 tp_is_empty!24943)))

(declare-fun mapIsEmpty!39079 () Bool)

(assert (=> mapIsEmpty!39079 mapRes!39079))

(declare-fun res!707641 () Bool)

(declare-fun e!602864 () Bool)

(assert (=> start!93632 (=> (not res!707641) (not e!602864))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93632 (= res!707641 (validMask!0 mask!1515))))

(assert (=> start!93632 e!602864))

(assert (=> start!93632 true))

(declare-fun e!602862 () Bool)

(declare-fun array_inv!24916 (array!66856) Bool)

(assert (=> start!93632 (and (array_inv!24916 _values!955) e!602862)))

(declare-datatypes ((array!66858 0))(
  ( (array!66859 (arr!32139 (Array (_ BitVec 32) (_ BitVec 64))) (size!32677 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66858)

(declare-fun array_inv!24917 (array!66858) Bool)

(assert (=> start!93632 (array_inv!24917 _keys!1163)))

(declare-fun b!1059259 () Bool)

(assert (=> b!1059259 (= e!602864 false)))

(declare-fun lt!466919 () Bool)

(declare-datatypes ((List!22457 0))(
  ( (Nil!22454) (Cons!22453 (h!23662 (_ BitVec 64)) (t!31755 List!22457)) )
))
(declare-fun arrayNoDuplicates!0 (array!66858 (_ BitVec 32) List!22457) Bool)

(assert (=> b!1059259 (= lt!466919 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22454))))

(declare-fun b!1059260 () Bool)

(declare-fun res!707640 () Bool)

(assert (=> b!1059260 (=> (not res!707640) (not e!602864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66858 (_ BitVec 32)) Bool)

(assert (=> b!1059260 (= res!707640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059261 () Bool)

(declare-fun e!602865 () Bool)

(assert (=> b!1059261 (= e!602865 tp_is_empty!24943)))

(declare-fun b!1059262 () Bool)

(declare-fun res!707639 () Bool)

(assert (=> b!1059262 (=> (not res!707639) (not e!602864))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059262 (= res!707639 (and (= (size!32676 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32677 _keys!1163) (size!32676 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059263 () Bool)

(assert (=> b!1059263 (= e!602862 (and e!602865 mapRes!39079))))

(declare-fun condMapEmpty!39079 () Bool)

(declare-fun mapDefault!39079 () ValueCell!11768)

(assert (=> b!1059263 (= condMapEmpty!39079 (= (arr!32138 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11768)) mapDefault!39079)))))

(assert (= (and start!93632 res!707641) b!1059262))

(assert (= (and b!1059262 res!707639) b!1059260))

(assert (= (and b!1059260 res!707640) b!1059259))

(assert (= (and b!1059263 condMapEmpty!39079) mapIsEmpty!39079))

(assert (= (and b!1059263 (not condMapEmpty!39079)) mapNonEmpty!39079))

(get-info :version)

(assert (= (and mapNonEmpty!39079 ((_ is ValueCellFull!11768) mapValue!39079)) b!1059258))

(assert (= (and b!1059263 ((_ is ValueCellFull!11768) mapDefault!39079)) b!1059261))

(assert (= start!93632 b!1059263))

(declare-fun m!978221 () Bool)

(assert (=> mapNonEmpty!39079 m!978221))

(declare-fun m!978223 () Bool)

(assert (=> start!93632 m!978223))

(declare-fun m!978225 () Bool)

(assert (=> start!93632 m!978225))

(declare-fun m!978227 () Bool)

(assert (=> start!93632 m!978227))

(declare-fun m!978229 () Bool)

(assert (=> b!1059259 m!978229))

(declare-fun m!978231 () Bool)

(assert (=> b!1059260 m!978231))

(check-sat (not start!93632) (not b!1059260) (not b!1059259) (not mapNonEmpty!39079) tp_is_empty!24943)
(check-sat)
