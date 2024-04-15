; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82510 () Bool)

(assert start!82510)

(declare-fun res!643510 () Bool)

(declare-fun e!542193 () Bool)

(assert (=> start!82510 (=> (not res!643510) (not e!542193))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82510 (= res!643510 (validMask!0 mask!2110))))

(assert (=> start!82510 e!542193))

(assert (=> start!82510 true))

(declare-datatypes ((V!33601 0))(
  ( (V!33602 (val!10782 Int)) )
))
(declare-datatypes ((ValueCell!10250 0))(
  ( (ValueCellFull!10250 (v!13339 V!33601)) (EmptyCell!10250) )
))
(declare-datatypes ((array!58956 0))(
  ( (array!58957 (arr!28347 (Array (_ BitVec 32) ValueCell!10250)) (size!28828 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58956)

(declare-fun e!542197 () Bool)

(declare-fun array_inv!22023 (array!58956) Bool)

(assert (=> start!82510 (and (array_inv!22023 _values!1400) e!542197)))

(declare-datatypes ((array!58958 0))(
  ( (array!58959 (arr!28348 (Array (_ BitVec 32) (_ BitVec 64))) (size!28829 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58958)

(declare-fun array_inv!22024 (array!58958) Bool)

(assert (=> start!82510 (array_inv!22024 _keys!1686)))

(declare-fun b!961491 () Bool)

(declare-fun e!542194 () Bool)

(declare-fun tp_is_empty!21463 () Bool)

(assert (=> b!961491 (= e!542194 tp_is_empty!21463)))

(declare-fun b!961492 () Bool)

(assert (=> b!961492 (= e!542193 false)))

(declare-fun lt!430568 () Bool)

(declare-datatypes ((List!19715 0))(
  ( (Nil!19712) (Cons!19711 (h!20873 (_ BitVec 64)) (t!28069 List!19715)) )
))
(declare-fun arrayNoDuplicates!0 (array!58958 (_ BitVec 32) List!19715) Bool)

(assert (=> b!961492 (= lt!430568 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19712))))

(declare-fun b!961493 () Bool)

(declare-fun e!542195 () Bool)

(assert (=> b!961493 (= e!542195 tp_is_empty!21463)))

(declare-fun b!961494 () Bool)

(declare-fun res!643509 () Bool)

(assert (=> b!961494 (=> (not res!643509) (not e!542193))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961494 (= res!643509 (and (= (size!28828 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28829 _keys!1686) (size!28828 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34189 () Bool)

(declare-fun mapRes!34189 () Bool)

(declare-fun tp!65119 () Bool)

(assert (=> mapNonEmpty!34189 (= mapRes!34189 (and tp!65119 e!542194))))

(declare-fun mapValue!34189 () ValueCell!10250)

(declare-fun mapKey!34189 () (_ BitVec 32))

(declare-fun mapRest!34189 () (Array (_ BitVec 32) ValueCell!10250))

(assert (=> mapNonEmpty!34189 (= (arr!28347 _values!1400) (store mapRest!34189 mapKey!34189 mapValue!34189))))

(declare-fun mapIsEmpty!34189 () Bool)

(assert (=> mapIsEmpty!34189 mapRes!34189))

(declare-fun b!961495 () Bool)

(declare-fun res!643511 () Bool)

(assert (=> b!961495 (=> (not res!643511) (not e!542193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58958 (_ BitVec 32)) Bool)

(assert (=> b!961495 (= res!643511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961496 () Bool)

(assert (=> b!961496 (= e!542197 (and e!542195 mapRes!34189))))

(declare-fun condMapEmpty!34189 () Bool)

(declare-fun mapDefault!34189 () ValueCell!10250)

(assert (=> b!961496 (= condMapEmpty!34189 (= (arr!28347 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10250)) mapDefault!34189)))))

(assert (= (and start!82510 res!643510) b!961494))

(assert (= (and b!961494 res!643509) b!961495))

(assert (= (and b!961495 res!643511) b!961492))

(assert (= (and b!961496 condMapEmpty!34189) mapIsEmpty!34189))

(assert (= (and b!961496 (not condMapEmpty!34189)) mapNonEmpty!34189))

(get-info :version)

(assert (= (and mapNonEmpty!34189 ((_ is ValueCellFull!10250) mapValue!34189)) b!961491))

(assert (= (and b!961496 ((_ is ValueCellFull!10250) mapDefault!34189)) b!961493))

(assert (= start!82510 b!961496))

(declare-fun m!890827 () Bool)

(assert (=> start!82510 m!890827))

(declare-fun m!890829 () Bool)

(assert (=> start!82510 m!890829))

(declare-fun m!890831 () Bool)

(assert (=> start!82510 m!890831))

(declare-fun m!890833 () Bool)

(assert (=> b!961492 m!890833))

(declare-fun m!890835 () Bool)

(assert (=> mapNonEmpty!34189 m!890835))

(declare-fun m!890837 () Bool)

(assert (=> b!961495 m!890837))

(check-sat (not b!961492) (not start!82510) (not b!961495) (not mapNonEmpty!34189) tp_is_empty!21463)
(check-sat)
