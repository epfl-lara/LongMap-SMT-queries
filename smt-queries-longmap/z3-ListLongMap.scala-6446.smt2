; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82684 () Bool)

(assert start!82684)

(declare-fun b!962525 () Bool)

(declare-fun e!542834 () Bool)

(declare-fun tp_is_empty!21451 () Bool)

(assert (=> b!962525 (= e!542834 tp_is_empty!21451)))

(declare-fun mapIsEmpty!34171 () Bool)

(declare-fun mapRes!34171 () Bool)

(assert (=> mapIsEmpty!34171 mapRes!34171))

(declare-fun b!962526 () Bool)

(declare-fun e!542837 () Bool)

(assert (=> b!962526 (= e!542837 false)))

(declare-fun lt!431147 () Bool)

(declare-datatypes ((array!59022 0))(
  ( (array!59023 (arr!28375 (Array (_ BitVec 32) (_ BitVec 64))) (size!28855 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59022)

(declare-datatypes ((List!19675 0))(
  ( (Nil!19672) (Cons!19671 (h!20839 (_ BitVec 64)) (t!28030 List!19675)) )
))
(declare-fun arrayNoDuplicates!0 (array!59022 (_ BitVec 32) List!19675) Bool)

(assert (=> b!962526 (= lt!431147 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19672))))

(declare-fun res!643909 () Bool)

(assert (=> start!82684 (=> (not res!643909) (not e!542837))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82684 (= res!643909 (validMask!0 mask!2110))))

(assert (=> start!82684 e!542837))

(assert (=> start!82684 true))

(declare-datatypes ((V!33585 0))(
  ( (V!33586 (val!10776 Int)) )
))
(declare-datatypes ((ValueCell!10244 0))(
  ( (ValueCellFull!10244 (v!13331 V!33585)) (EmptyCell!10244) )
))
(declare-datatypes ((array!59024 0))(
  ( (array!59025 (arr!28376 (Array (_ BitVec 32) ValueCell!10244)) (size!28856 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59024)

(declare-fun e!542835 () Bool)

(declare-fun array_inv!22063 (array!59024) Bool)

(assert (=> start!82684 (and (array_inv!22063 _values!1400) e!542835)))

(declare-fun array_inv!22064 (array!59022) Bool)

(assert (=> start!82684 (array_inv!22064 _keys!1686)))

(declare-fun mapNonEmpty!34171 () Bool)

(declare-fun tp!65101 () Bool)

(assert (=> mapNonEmpty!34171 (= mapRes!34171 (and tp!65101 e!542834))))

(declare-fun mapRest!34171 () (Array (_ BitVec 32) ValueCell!10244))

(declare-fun mapValue!34171 () ValueCell!10244)

(declare-fun mapKey!34171 () (_ BitVec 32))

(assert (=> mapNonEmpty!34171 (= (arr!28376 _values!1400) (store mapRest!34171 mapKey!34171 mapValue!34171))))

(declare-fun b!962527 () Bool)

(declare-fun e!542833 () Bool)

(assert (=> b!962527 (= e!542833 tp_is_empty!21451)))

(declare-fun b!962528 () Bool)

(declare-fun res!643910 () Bool)

(assert (=> b!962528 (=> (not res!643910) (not e!542837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59022 (_ BitVec 32)) Bool)

(assert (=> b!962528 (= res!643910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962529 () Bool)

(declare-fun res!643911 () Bool)

(assert (=> b!962529 (=> (not res!643911) (not e!542837))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962529 (= res!643911 (and (= (size!28856 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28855 _keys!1686) (size!28856 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962530 () Bool)

(assert (=> b!962530 (= e!542835 (and e!542833 mapRes!34171))))

(declare-fun condMapEmpty!34171 () Bool)

(declare-fun mapDefault!34171 () ValueCell!10244)

(assert (=> b!962530 (= condMapEmpty!34171 (= (arr!28376 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10244)) mapDefault!34171)))))

(assert (= (and start!82684 res!643909) b!962529))

(assert (= (and b!962529 res!643911) b!962528))

(assert (= (and b!962528 res!643910) b!962526))

(assert (= (and b!962530 condMapEmpty!34171) mapIsEmpty!34171))

(assert (= (and b!962530 (not condMapEmpty!34171)) mapNonEmpty!34171))

(get-info :version)

(assert (= (and mapNonEmpty!34171 ((_ is ValueCellFull!10244) mapValue!34171)) b!962525))

(assert (= (and b!962530 ((_ is ValueCellFull!10244) mapDefault!34171)) b!962527))

(assert (= start!82684 b!962530))

(declare-fun m!892807 () Bool)

(assert (=> b!962526 m!892807))

(declare-fun m!892809 () Bool)

(assert (=> start!82684 m!892809))

(declare-fun m!892811 () Bool)

(assert (=> start!82684 m!892811))

(declare-fun m!892813 () Bool)

(assert (=> start!82684 m!892813))

(declare-fun m!892815 () Bool)

(assert (=> mapNonEmpty!34171 m!892815))

(declare-fun m!892817 () Bool)

(assert (=> b!962528 m!892817))

(check-sat (not b!962526) (not mapNonEmpty!34171) (not start!82684) (not b!962528) tp_is_empty!21451)
(check-sat)
