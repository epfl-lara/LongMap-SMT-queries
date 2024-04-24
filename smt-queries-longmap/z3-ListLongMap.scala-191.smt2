; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3762 () Bool)

(assert start!3762)

(declare-fun mapIsEmpty!1147 () Bool)

(declare-fun mapRes!1147 () Bool)

(assert (=> mapIsEmpty!1147 mapRes!1147))

(declare-fun res!15579 () Bool)

(declare-fun e!17045 () Bool)

(assert (=> start!3762 (=> (not res!15579) (not e!17045))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3762 (= res!15579 (validMask!0 mask!2294))))

(assert (=> start!3762 e!17045))

(assert (=> start!3762 true))

(declare-datatypes ((V!1275 0))(
  ( (V!1276 (val!570 Int)) )
))
(declare-datatypes ((ValueCell!344 0))(
  ( (ValueCellFull!344 (v!1656 V!1275)) (EmptyCell!344) )
))
(declare-datatypes ((array!1401 0))(
  ( (array!1402 (arr!658 (Array (_ BitVec 32) ValueCell!344)) (size!759 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1401)

(declare-fun e!17044 () Bool)

(declare-fun array_inv!461 (array!1401) Bool)

(assert (=> start!3762 (and (array_inv!461 _values!1501) e!17044)))

(declare-datatypes ((array!1403 0))(
  ( (array!1404 (arr!659 (Array (_ BitVec 32) (_ BitVec 64))) (size!760 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1403)

(declare-fun array_inv!462 (array!1403) Bool)

(assert (=> start!3762 (array_inv!462 _keys!1833)))

(declare-fun b!26216 () Bool)

(declare-fun e!17046 () Bool)

(assert (=> b!26216 (= e!17044 (and e!17046 mapRes!1147))))

(declare-fun condMapEmpty!1147 () Bool)

(declare-fun mapDefault!1147 () ValueCell!344)

(assert (=> b!26216 (= condMapEmpty!1147 (= (arr!658 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!344)) mapDefault!1147)))))

(declare-fun b!26217 () Bool)

(declare-fun tp_is_empty!1087 () Bool)

(assert (=> b!26217 (= e!17046 tp_is_empty!1087)))

(declare-fun b!26218 () Bool)

(declare-fun e!17043 () Bool)

(assert (=> b!26218 (= e!17043 tp_is_empty!1087)))

(declare-fun mapNonEmpty!1147 () Bool)

(declare-fun tp!3667 () Bool)

(assert (=> mapNonEmpty!1147 (= mapRes!1147 (and tp!3667 e!17043))))

(declare-fun mapKey!1147 () (_ BitVec 32))

(declare-fun mapRest!1147 () (Array (_ BitVec 32) ValueCell!344))

(declare-fun mapValue!1147 () ValueCell!344)

(assert (=> mapNonEmpty!1147 (= (arr!658 _values!1501) (store mapRest!1147 mapKey!1147 mapValue!1147))))

(declare-fun b!26219 () Bool)

(declare-fun res!15581 () Bool)

(assert (=> b!26219 (=> (not res!15581) (not e!17045))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26219 (= res!15581 (and (= (size!759 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!760 _keys!1833) (size!759 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26220 () Bool)

(declare-fun res!15580 () Bool)

(assert (=> b!26220 (=> (not res!15580) (not e!17045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1403 (_ BitVec 32)) Bool)

(assert (=> b!26220 (= res!15580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26221 () Bool)

(assert (=> b!26221 (= e!17045 false)))

(declare-fun lt!10296 () Bool)

(declare-datatypes ((List!579 0))(
  ( (Nil!576) (Cons!575 (h!1142 (_ BitVec 64)) (t!3260 List!579)) )
))
(declare-fun arrayNoDuplicates!0 (array!1403 (_ BitVec 32) List!579) Bool)

(assert (=> b!26221 (= lt!10296 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!576))))

(assert (= (and start!3762 res!15579) b!26219))

(assert (= (and b!26219 res!15581) b!26220))

(assert (= (and b!26220 res!15580) b!26221))

(assert (= (and b!26216 condMapEmpty!1147) mapIsEmpty!1147))

(assert (= (and b!26216 (not condMapEmpty!1147)) mapNonEmpty!1147))

(get-info :version)

(assert (= (and mapNonEmpty!1147 ((_ is ValueCellFull!344) mapValue!1147)) b!26218))

(assert (= (and b!26216 ((_ is ValueCellFull!344) mapDefault!1147)) b!26217))

(assert (= start!3762 b!26216))

(declare-fun m!20961 () Bool)

(assert (=> start!3762 m!20961))

(declare-fun m!20963 () Bool)

(assert (=> start!3762 m!20963))

(declare-fun m!20965 () Bool)

(assert (=> start!3762 m!20965))

(declare-fun m!20967 () Bool)

(assert (=> mapNonEmpty!1147 m!20967))

(declare-fun m!20969 () Bool)

(assert (=> b!26220 m!20969))

(declare-fun m!20971 () Bool)

(assert (=> b!26221 m!20971))

(check-sat (not mapNonEmpty!1147) (not b!26221) (not start!3762) (not b!26220) tp_is_empty!1087)
(check-sat)
