; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110448 () Bool)

(assert start!110448)

(declare-fun b!1306642 () Bool)

(declare-fun e!745486 () Bool)

(assert (=> b!1306642 (= e!745486 false)))

(declare-fun lt!584952 () Bool)

(declare-datatypes ((array!87040 0))(
  ( (array!87041 (arr!42000 (Array (_ BitVec 32) (_ BitVec 64))) (size!42550 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87040)

(declare-datatypes ((List!29794 0))(
  ( (Nil!29791) (Cons!29790 (h!30999 (_ BitVec 64)) (t!43400 List!29794)) )
))
(declare-fun arrayNoDuplicates!0 (array!87040 (_ BitVec 32) List!29794) Bool)

(assert (=> b!1306642 (= lt!584952 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29791))))

(declare-fun b!1306643 () Bool)

(declare-fun e!745485 () Bool)

(declare-fun tp_is_empty!35013 () Bool)

(assert (=> b!1306643 (= e!745485 tp_is_empty!35013)))

(declare-fun b!1306644 () Bool)

(declare-fun e!745484 () Bool)

(declare-fun e!745483 () Bool)

(declare-fun mapRes!54148 () Bool)

(assert (=> b!1306644 (= e!745484 (and e!745483 mapRes!54148))))

(declare-fun condMapEmpty!54148 () Bool)

(declare-datatypes ((V!51787 0))(
  ( (V!51788 (val!17581 Int)) )
))
(declare-datatypes ((ValueCell!16608 0))(
  ( (ValueCellFull!16608 (v!20208 V!51787)) (EmptyCell!16608) )
))
(declare-datatypes ((array!87042 0))(
  ( (array!87043 (arr!42001 (Array (_ BitVec 32) ValueCell!16608)) (size!42551 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87042)

(declare-fun mapDefault!54148 () ValueCell!16608)

(assert (=> b!1306644 (= condMapEmpty!54148 (= (arr!42001 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16608)) mapDefault!54148)))))

(declare-fun res!867413 () Bool)

(assert (=> start!110448 (=> (not res!867413) (not e!745486))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110448 (= res!867413 (validMask!0 mask!2040))))

(assert (=> start!110448 e!745486))

(assert (=> start!110448 true))

(declare-fun array_inv!31753 (array!87042) Bool)

(assert (=> start!110448 (and (array_inv!31753 _values!1354) e!745484)))

(declare-fun array_inv!31754 (array!87040) Bool)

(assert (=> start!110448 (array_inv!31754 _keys!1628)))

(declare-fun b!1306645 () Bool)

(declare-fun res!867412 () Bool)

(assert (=> b!1306645 (=> (not res!867412) (not e!745486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87040 (_ BitVec 32)) Bool)

(assert (=> b!1306645 (= res!867412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54148 () Bool)

(declare-fun tp!103228 () Bool)

(assert (=> mapNonEmpty!54148 (= mapRes!54148 (and tp!103228 e!745485))))

(declare-fun mapKey!54148 () (_ BitVec 32))

(declare-fun mapValue!54148 () ValueCell!16608)

(declare-fun mapRest!54148 () (Array (_ BitVec 32) ValueCell!16608))

(assert (=> mapNonEmpty!54148 (= (arr!42001 _values!1354) (store mapRest!54148 mapKey!54148 mapValue!54148))))

(declare-fun mapIsEmpty!54148 () Bool)

(assert (=> mapIsEmpty!54148 mapRes!54148))

(declare-fun b!1306646 () Bool)

(assert (=> b!1306646 (= e!745483 tp_is_empty!35013)))

(declare-fun b!1306647 () Bool)

(declare-fun res!867414 () Bool)

(assert (=> b!1306647 (=> (not res!867414) (not e!745486))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306647 (= res!867414 (and (= (size!42551 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42550 _keys!1628) (size!42551 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110448 res!867413) b!1306647))

(assert (= (and b!1306647 res!867414) b!1306645))

(assert (= (and b!1306645 res!867412) b!1306642))

(assert (= (and b!1306644 condMapEmpty!54148) mapIsEmpty!54148))

(assert (= (and b!1306644 (not condMapEmpty!54148)) mapNonEmpty!54148))

(get-info :version)

(assert (= (and mapNonEmpty!54148 ((_ is ValueCellFull!16608) mapValue!54148)) b!1306643))

(assert (= (and b!1306644 ((_ is ValueCellFull!16608) mapDefault!54148)) b!1306646))

(assert (= start!110448 b!1306644))

(declare-fun m!1197609 () Bool)

(assert (=> b!1306642 m!1197609))

(declare-fun m!1197611 () Bool)

(assert (=> start!110448 m!1197611))

(declare-fun m!1197613 () Bool)

(assert (=> start!110448 m!1197613))

(declare-fun m!1197615 () Bool)

(assert (=> start!110448 m!1197615))

(declare-fun m!1197617 () Bool)

(assert (=> b!1306645 m!1197617))

(declare-fun m!1197619 () Bool)

(assert (=> mapNonEmpty!54148 m!1197619))

(check-sat (not b!1306642) (not b!1306645) (not mapNonEmpty!54148) (not start!110448) tp_is_empty!35013)
(check-sat)
