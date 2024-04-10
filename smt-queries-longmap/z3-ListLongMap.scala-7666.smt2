; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96318 () Bool)

(assert start!96318)

(declare-fun mapIsEmpty!42214 () Bool)

(declare-fun mapRes!42214 () Bool)

(assert (=> mapIsEmpty!42214 mapRes!42214))

(declare-fun b!1094585 () Bool)

(declare-fun e!624932 () Bool)

(declare-fun e!624928 () Bool)

(assert (=> b!1094585 (= e!624932 (and e!624928 mapRes!42214))))

(declare-fun condMapEmpty!42214 () Bool)

(declare-datatypes ((V!41091 0))(
  ( (V!41092 (val!13543 Int)) )
))
(declare-datatypes ((ValueCell!12777 0))(
  ( (ValueCellFull!12777 (v!16164 V!41091)) (EmptyCell!12777) )
))
(declare-datatypes ((array!70859 0))(
  ( (array!70860 (arr!34103 (Array (_ BitVec 32) ValueCell!12777)) (size!34639 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70859)

(declare-fun mapDefault!42214 () ValueCell!12777)

(assert (=> b!1094585 (= condMapEmpty!42214 (= (arr!34103 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12777)) mapDefault!42214)))))

(declare-fun b!1094586 () Bool)

(declare-fun res!730453 () Bool)

(declare-fun e!624930 () Bool)

(assert (=> b!1094586 (=> (not res!730453) (not e!624930))))

(declare-datatypes ((array!70861 0))(
  ( (array!70862 (arr!34104 (Array (_ BitVec 32) (_ BitVec 64))) (size!34640 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70861)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094586 (= res!730453 (= (select (arr!34104 _keys!1070) i!650) k0!904))))

(declare-fun b!1094587 () Bool)

(declare-fun res!730450 () Bool)

(assert (=> b!1094587 (=> (not res!730450) (not e!624930))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094587 (= res!730450 (and (= (size!34639 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34640 _keys!1070) (size!34639 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094588 () Bool)

(assert (=> b!1094588 (= e!624930 false)))

(declare-fun lt!489670 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70861 (_ BitVec 32)) Bool)

(assert (=> b!1094588 (= lt!489670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!70862 (store (arr!34104 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34640 _keys!1070)) mask!1414))))

(declare-fun b!1094589 () Bool)

(declare-fun res!730449 () Bool)

(assert (=> b!1094589 (=> (not res!730449) (not e!624930))))

(declare-datatypes ((List!23822 0))(
  ( (Nil!23819) (Cons!23818 (h!25027 (_ BitVec 64)) (t!33829 List!23822)) )
))
(declare-fun arrayNoDuplicates!0 (array!70861 (_ BitVec 32) List!23822) Bool)

(assert (=> b!1094589 (= res!730449 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23819))))

(declare-fun res!730455 () Bool)

(assert (=> start!96318 (=> (not res!730455) (not e!624930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96318 (= res!730455 (validMask!0 mask!1414))))

(assert (=> start!96318 e!624930))

(assert (=> start!96318 true))

(declare-fun array_inv!26278 (array!70861) Bool)

(assert (=> start!96318 (array_inv!26278 _keys!1070)))

(declare-fun array_inv!26279 (array!70859) Bool)

(assert (=> start!96318 (and (array_inv!26279 _values!874) e!624932)))

(declare-fun b!1094590 () Bool)

(declare-fun tp_is_empty!26973 () Bool)

(assert (=> b!1094590 (= e!624928 tp_is_empty!26973)))

(declare-fun mapNonEmpty!42214 () Bool)

(declare-fun tp!80729 () Bool)

(declare-fun e!624931 () Bool)

(assert (=> mapNonEmpty!42214 (= mapRes!42214 (and tp!80729 e!624931))))

(declare-fun mapRest!42214 () (Array (_ BitVec 32) ValueCell!12777))

(declare-fun mapKey!42214 () (_ BitVec 32))

(declare-fun mapValue!42214 () ValueCell!12777)

(assert (=> mapNonEmpty!42214 (= (arr!34103 _values!874) (store mapRest!42214 mapKey!42214 mapValue!42214))))

(declare-fun b!1094591 () Bool)

(assert (=> b!1094591 (= e!624931 tp_is_empty!26973)))

(declare-fun b!1094592 () Bool)

(declare-fun res!730451 () Bool)

(assert (=> b!1094592 (=> (not res!730451) (not e!624930))))

(assert (=> b!1094592 (= res!730451 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34640 _keys!1070))))))

(declare-fun b!1094593 () Bool)

(declare-fun res!730452 () Bool)

(assert (=> b!1094593 (=> (not res!730452) (not e!624930))))

(assert (=> b!1094593 (= res!730452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094594 () Bool)

(declare-fun res!730454 () Bool)

(assert (=> b!1094594 (=> (not res!730454) (not e!624930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094594 (= res!730454 (validKeyInArray!0 k0!904))))

(assert (= (and start!96318 res!730455) b!1094587))

(assert (= (and b!1094587 res!730450) b!1094593))

(assert (= (and b!1094593 res!730452) b!1094589))

(assert (= (and b!1094589 res!730449) b!1094592))

(assert (= (and b!1094592 res!730451) b!1094594))

(assert (= (and b!1094594 res!730454) b!1094586))

(assert (= (and b!1094586 res!730453) b!1094588))

(assert (= (and b!1094585 condMapEmpty!42214) mapIsEmpty!42214))

(assert (= (and b!1094585 (not condMapEmpty!42214)) mapNonEmpty!42214))

(get-info :version)

(assert (= (and mapNonEmpty!42214 ((_ is ValueCellFull!12777) mapValue!42214)) b!1094591))

(assert (= (and b!1094585 ((_ is ValueCellFull!12777) mapDefault!42214)) b!1094590))

(assert (= start!96318 b!1094585))

(declare-fun m!1014477 () Bool)

(assert (=> b!1094593 m!1014477))

(declare-fun m!1014479 () Bool)

(assert (=> b!1094589 m!1014479))

(declare-fun m!1014481 () Bool)

(assert (=> b!1094586 m!1014481))

(declare-fun m!1014483 () Bool)

(assert (=> b!1094588 m!1014483))

(declare-fun m!1014485 () Bool)

(assert (=> b!1094588 m!1014485))

(declare-fun m!1014487 () Bool)

(assert (=> mapNonEmpty!42214 m!1014487))

(declare-fun m!1014489 () Bool)

(assert (=> start!96318 m!1014489))

(declare-fun m!1014491 () Bool)

(assert (=> start!96318 m!1014491))

(declare-fun m!1014493 () Bool)

(assert (=> start!96318 m!1014493))

(declare-fun m!1014495 () Bool)

(assert (=> b!1094594 m!1014495))

(check-sat (not b!1094588) (not b!1094593) (not b!1094589) (not start!96318) (not mapNonEmpty!42214) tp_is_empty!26973 (not b!1094594))
(check-sat)
