; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41380 () Bool)

(assert start!41380)

(declare-fun b!462556 () Bool)

(declare-fun res!276647 () Bool)

(declare-fun e!269956 () Bool)

(assert (=> b!462556 (=> (not res!276647) (not e!269956))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28820 0))(
  ( (array!28821 (arr!13843 (Array (_ BitVec 32) (_ BitVec 64))) (size!14195 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28820)

(declare-datatypes ((V!17787 0))(
  ( (V!17788 (val!6300 Int)) )
))
(declare-datatypes ((ValueCell!5912 0))(
  ( (ValueCellFull!5912 (v!8588 V!17787)) (EmptyCell!5912) )
))
(declare-datatypes ((array!28822 0))(
  ( (array!28823 (arr!13844 (Array (_ BitVec 32) ValueCell!5912)) (size!14196 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28822)

(assert (=> b!462556 (= res!276647 (and (= (size!14196 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14195 _keys!1025) (size!14196 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462557 () Bool)

(declare-fun e!269958 () Bool)

(declare-fun tp_is_empty!12511 () Bool)

(assert (=> b!462557 (= e!269958 tp_is_empty!12511)))

(declare-fun b!462558 () Bool)

(declare-fun e!269955 () Bool)

(assert (=> b!462558 (= e!269955 tp_is_empty!12511)))

(declare-fun mapNonEmpty!20437 () Bool)

(declare-fun mapRes!20437 () Bool)

(declare-fun tp!39256 () Bool)

(assert (=> mapNonEmpty!20437 (= mapRes!20437 (and tp!39256 e!269955))))

(declare-fun mapValue!20437 () ValueCell!5912)

(declare-fun mapKey!20437 () (_ BitVec 32))

(declare-fun mapRest!20437 () (Array (_ BitVec 32) ValueCell!5912))

(assert (=> mapNonEmpty!20437 (= (arr!13844 _values!833) (store mapRest!20437 mapKey!20437 mapValue!20437))))

(declare-fun mapIsEmpty!20437 () Bool)

(assert (=> mapIsEmpty!20437 mapRes!20437))

(declare-fun b!462559 () Bool)

(assert (=> b!462559 (= e!269956 false)))

(declare-fun lt!209252 () Bool)

(declare-datatypes ((List!8275 0))(
  ( (Nil!8272) (Cons!8271 (h!9127 (_ BitVec 64)) (t!14211 List!8275)) )
))
(declare-fun arrayNoDuplicates!0 (array!28820 (_ BitVec 32) List!8275) Bool)

(assert (=> b!462559 (= lt!209252 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8272))))

(declare-fun res!276649 () Bool)

(assert (=> start!41380 (=> (not res!276649) (not e!269956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41380 (= res!276649 (validMask!0 mask!1365))))

(assert (=> start!41380 e!269956))

(assert (=> start!41380 true))

(declare-fun array_inv!10090 (array!28820) Bool)

(assert (=> start!41380 (array_inv!10090 _keys!1025)))

(declare-fun e!269954 () Bool)

(declare-fun array_inv!10091 (array!28822) Bool)

(assert (=> start!41380 (and (array_inv!10091 _values!833) e!269954)))

(declare-fun b!462560 () Bool)

(declare-fun res!276648 () Bool)

(assert (=> b!462560 (=> (not res!276648) (not e!269956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28820 (_ BitVec 32)) Bool)

(assert (=> b!462560 (= res!276648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462561 () Bool)

(assert (=> b!462561 (= e!269954 (and e!269958 mapRes!20437))))

(declare-fun condMapEmpty!20437 () Bool)

(declare-fun mapDefault!20437 () ValueCell!5912)

(assert (=> b!462561 (= condMapEmpty!20437 (= (arr!13844 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5912)) mapDefault!20437)))))

(assert (= (and start!41380 res!276649) b!462556))

(assert (= (and b!462556 res!276647) b!462560))

(assert (= (and b!462560 res!276648) b!462559))

(assert (= (and b!462561 condMapEmpty!20437) mapIsEmpty!20437))

(assert (= (and b!462561 (not condMapEmpty!20437)) mapNonEmpty!20437))

(get-info :version)

(assert (= (and mapNonEmpty!20437 ((_ is ValueCellFull!5912) mapValue!20437)) b!462558))

(assert (= (and b!462561 ((_ is ValueCellFull!5912) mapDefault!20437)) b!462557))

(assert (= start!41380 b!462561))

(declare-fun m!445679 () Bool)

(assert (=> mapNonEmpty!20437 m!445679))

(declare-fun m!445681 () Bool)

(assert (=> b!462559 m!445681))

(declare-fun m!445683 () Bool)

(assert (=> start!41380 m!445683))

(declare-fun m!445685 () Bool)

(assert (=> start!41380 m!445685))

(declare-fun m!445687 () Bool)

(assert (=> start!41380 m!445687))

(declare-fun m!445689 () Bool)

(assert (=> b!462560 m!445689))

(check-sat (not b!462560) tp_is_empty!12511 (not mapNonEmpty!20437) (not b!462559) (not start!41380))
(check-sat)
