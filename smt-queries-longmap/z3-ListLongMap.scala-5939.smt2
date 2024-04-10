; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77452 () Bool)

(assert start!77452)

(declare-fun b!902650 () Bool)

(declare-fun e!505575 () Bool)

(declare-fun e!505577 () Bool)

(declare-fun mapRes!29407 () Bool)

(assert (=> b!902650 (= e!505575 (and e!505577 mapRes!29407))))

(declare-fun condMapEmpty!29407 () Bool)

(declare-datatypes ((V!29585 0))(
  ( (V!29586 (val!9283 Int)) )
))
(declare-datatypes ((ValueCell!8751 0))(
  ( (ValueCellFull!8751 (v!11788 V!29585)) (EmptyCell!8751) )
))
(declare-datatypes ((array!52992 0))(
  ( (array!52993 (arr!25456 (Array (_ BitVec 32) ValueCell!8751)) (size!25915 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52992)

(declare-fun mapDefault!29407 () ValueCell!8751)

(assert (=> b!902650 (= condMapEmpty!29407 (= (arr!25456 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8751)) mapDefault!29407)))))

(declare-fun b!902651 () Bool)

(declare-fun res!609122 () Bool)

(declare-fun e!505574 () Bool)

(assert (=> b!902651 (=> (not res!609122) (not e!505574))))

(declare-datatypes ((array!52994 0))(
  ( (array!52995 (arr!25457 (Array (_ BitVec 32) (_ BitVec 64))) (size!25916 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52994)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52994 (_ BitVec 32)) Bool)

(assert (=> b!902651 (= res!609122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29407 () Bool)

(declare-fun tp!56466 () Bool)

(declare-fun e!505576 () Bool)

(assert (=> mapNonEmpty!29407 (= mapRes!29407 (and tp!56466 e!505576))))

(declare-fun mapRest!29407 () (Array (_ BitVec 32) ValueCell!8751))

(declare-fun mapValue!29407 () ValueCell!8751)

(declare-fun mapKey!29407 () (_ BitVec 32))

(assert (=> mapNonEmpty!29407 (= (arr!25456 _values!1152) (store mapRest!29407 mapKey!29407 mapValue!29407))))

(declare-fun b!902652 () Bool)

(declare-fun tp_is_empty!18465 () Bool)

(assert (=> b!902652 (= e!505576 tp_is_empty!18465)))

(declare-fun b!902653 () Bool)

(assert (=> b!902653 (= e!505574 false)))

(declare-fun lt!407892 () Bool)

(declare-datatypes ((List!17888 0))(
  ( (Nil!17885) (Cons!17884 (h!19030 (_ BitVec 64)) (t!25271 List!17888)) )
))
(declare-fun arrayNoDuplicates!0 (array!52994 (_ BitVec 32) List!17888) Bool)

(assert (=> b!902653 (= lt!407892 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17885))))

(declare-fun b!902654 () Bool)

(declare-fun res!609121 () Bool)

(assert (=> b!902654 (=> (not res!609121) (not e!505574))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902654 (= res!609121 (and (= (size!25915 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25916 _keys!1386) (size!25915 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902655 () Bool)

(assert (=> b!902655 (= e!505577 tp_is_empty!18465)))

(declare-fun mapIsEmpty!29407 () Bool)

(assert (=> mapIsEmpty!29407 mapRes!29407))

(declare-fun res!609120 () Bool)

(assert (=> start!77452 (=> (not res!609120) (not e!505574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77452 (= res!609120 (validMask!0 mask!1756))))

(assert (=> start!77452 e!505574))

(assert (=> start!77452 true))

(declare-fun array_inv!19954 (array!52992) Bool)

(assert (=> start!77452 (and (array_inv!19954 _values!1152) e!505575)))

(declare-fun array_inv!19955 (array!52994) Bool)

(assert (=> start!77452 (array_inv!19955 _keys!1386)))

(assert (= (and start!77452 res!609120) b!902654))

(assert (= (and b!902654 res!609121) b!902651))

(assert (= (and b!902651 res!609122) b!902653))

(assert (= (and b!902650 condMapEmpty!29407) mapIsEmpty!29407))

(assert (= (and b!902650 (not condMapEmpty!29407)) mapNonEmpty!29407))

(get-info :version)

(assert (= (and mapNonEmpty!29407 ((_ is ValueCellFull!8751) mapValue!29407)) b!902652))

(assert (= (and b!902650 ((_ is ValueCellFull!8751) mapDefault!29407)) b!902655))

(assert (= start!77452 b!902650))

(declare-fun m!838579 () Bool)

(assert (=> b!902651 m!838579))

(declare-fun m!838581 () Bool)

(assert (=> mapNonEmpty!29407 m!838581))

(declare-fun m!838583 () Bool)

(assert (=> b!902653 m!838583))

(declare-fun m!838585 () Bool)

(assert (=> start!77452 m!838585))

(declare-fun m!838587 () Bool)

(assert (=> start!77452 m!838587))

(declare-fun m!838589 () Bool)

(assert (=> start!77452 m!838589))

(check-sat (not start!77452) (not mapNonEmpty!29407) tp_is_empty!18465 (not b!902653) (not b!902651))
(check-sat)
