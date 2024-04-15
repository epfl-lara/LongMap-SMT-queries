; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82486 () Bool)

(assert start!82486)

(declare-fun b!961275 () Bool)

(declare-fun e!542013 () Bool)

(declare-fun tp_is_empty!21439 () Bool)

(assert (=> b!961275 (= e!542013 tp_is_empty!21439)))

(declare-fun b!961276 () Bool)

(declare-fun res!643403 () Bool)

(declare-fun e!542014 () Bool)

(assert (=> b!961276 (=> (not res!643403) (not e!542014))))

(declare-datatypes ((array!58908 0))(
  ( (array!58909 (arr!28323 (Array (_ BitVec 32) (_ BitVec 64))) (size!28804 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58908)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58908 (_ BitVec 32)) Bool)

(assert (=> b!961276 (= res!643403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961277 () Bool)

(declare-fun res!643402 () Bool)

(assert (=> b!961277 (=> (not res!643402) (not e!542014))))

(declare-datatypes ((V!33569 0))(
  ( (V!33570 (val!10770 Int)) )
))
(declare-datatypes ((ValueCell!10238 0))(
  ( (ValueCellFull!10238 (v!13327 V!33569)) (EmptyCell!10238) )
))
(declare-datatypes ((array!58910 0))(
  ( (array!58911 (arr!28324 (Array (_ BitVec 32) ValueCell!10238)) (size!28805 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58910)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961277 (= res!643402 (and (= (size!28805 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28804 _keys!1686) (size!28805 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961278 () Bool)

(assert (=> b!961278 (= e!542014 false)))

(declare-fun lt!430532 () Bool)

(declare-datatypes ((List!19706 0))(
  ( (Nil!19703) (Cons!19702 (h!20864 (_ BitVec 64)) (t!28060 List!19706)) )
))
(declare-fun arrayNoDuplicates!0 (array!58908 (_ BitVec 32) List!19706) Bool)

(assert (=> b!961278 (= lt!430532 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19703))))

(declare-fun b!961279 () Bool)

(declare-fun e!542017 () Bool)

(declare-fun e!542016 () Bool)

(declare-fun mapRes!34153 () Bool)

(assert (=> b!961279 (= e!542017 (and e!542016 mapRes!34153))))

(declare-fun condMapEmpty!34153 () Bool)

(declare-fun mapDefault!34153 () ValueCell!10238)

(assert (=> b!961279 (= condMapEmpty!34153 (= (arr!28324 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10238)) mapDefault!34153)))))

(declare-fun mapNonEmpty!34153 () Bool)

(declare-fun tp!65083 () Bool)

(assert (=> mapNonEmpty!34153 (= mapRes!34153 (and tp!65083 e!542013))))

(declare-fun mapKey!34153 () (_ BitVec 32))

(declare-fun mapValue!34153 () ValueCell!10238)

(declare-fun mapRest!34153 () (Array (_ BitVec 32) ValueCell!10238))

(assert (=> mapNonEmpty!34153 (= (arr!28324 _values!1400) (store mapRest!34153 mapKey!34153 mapValue!34153))))

(declare-fun res!643401 () Bool)

(assert (=> start!82486 (=> (not res!643401) (not e!542014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82486 (= res!643401 (validMask!0 mask!2110))))

(assert (=> start!82486 e!542014))

(assert (=> start!82486 true))

(declare-fun array_inv!22001 (array!58910) Bool)

(assert (=> start!82486 (and (array_inv!22001 _values!1400) e!542017)))

(declare-fun array_inv!22002 (array!58908) Bool)

(assert (=> start!82486 (array_inv!22002 _keys!1686)))

(declare-fun b!961280 () Bool)

(assert (=> b!961280 (= e!542016 tp_is_empty!21439)))

(declare-fun mapIsEmpty!34153 () Bool)

(assert (=> mapIsEmpty!34153 mapRes!34153))

(assert (= (and start!82486 res!643401) b!961277))

(assert (= (and b!961277 res!643402) b!961276))

(assert (= (and b!961276 res!643403) b!961278))

(assert (= (and b!961279 condMapEmpty!34153) mapIsEmpty!34153))

(assert (= (and b!961279 (not condMapEmpty!34153)) mapNonEmpty!34153))

(get-info :version)

(assert (= (and mapNonEmpty!34153 ((_ is ValueCellFull!10238) mapValue!34153)) b!961275))

(assert (= (and b!961279 ((_ is ValueCellFull!10238) mapDefault!34153)) b!961280))

(assert (= start!82486 b!961279))

(declare-fun m!890683 () Bool)

(assert (=> b!961276 m!890683))

(declare-fun m!890685 () Bool)

(assert (=> b!961278 m!890685))

(declare-fun m!890687 () Bool)

(assert (=> mapNonEmpty!34153 m!890687))

(declare-fun m!890689 () Bool)

(assert (=> start!82486 m!890689))

(declare-fun m!890691 () Bool)

(assert (=> start!82486 m!890691))

(declare-fun m!890693 () Bool)

(assert (=> start!82486 m!890693))

(check-sat (not start!82486) tp_is_empty!21439 (not b!961276) (not b!961278) (not mapNonEmpty!34153))
(check-sat)
