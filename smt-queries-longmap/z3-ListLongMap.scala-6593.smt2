; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83610 () Bool)

(assert start!83610)

(declare-datatypes ((array!60734 0))(
  ( (array!60735 (arr!29226 (Array (_ BitVec 32) (_ BitVec 64))) (size!29706 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60734)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun b!975520 () Bool)

(declare-fun e!549907 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975520 (= e!549907 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29706 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29706 _keys!1717)) (bvslt i!822 #b00000000000000000000000000000000)))))

(declare-fun b!975521 () Bool)

(declare-fun e!549903 () Bool)

(declare-fun tp_is_empty!22333 () Bool)

(assert (=> b!975521 (= e!549903 tp_is_empty!22333)))

(declare-fun mapIsEmpty!35509 () Bool)

(declare-fun mapRes!35509 () Bool)

(assert (=> mapIsEmpty!35509 mapRes!35509))

(declare-fun b!975522 () Bool)

(declare-fun res!652760 () Bool)

(assert (=> b!975522 (=> (not res!652760) (not e!549907))))

(declare-datatypes ((List!20270 0))(
  ( (Nil!20267) (Cons!20266 (h!21434 (_ BitVec 64)) (t!28739 List!20270)) )
))
(declare-fun arrayNoDuplicates!0 (array!60734 (_ BitVec 32) List!20270) Bool)

(assert (=> b!975522 (= res!652760 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20267))))

(declare-fun res!652758 () Bool)

(assert (=> start!83610 (=> (not res!652758) (not e!549907))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83610 (= res!652758 (validMask!0 mask!2147))))

(assert (=> start!83610 e!549907))

(assert (=> start!83610 true))

(declare-datatypes ((V!34761 0))(
  ( (V!34762 (val!11217 Int)) )
))
(declare-datatypes ((ValueCell!10685 0))(
  ( (ValueCellFull!10685 (v!13773 V!34761)) (EmptyCell!10685) )
))
(declare-datatypes ((array!60736 0))(
  ( (array!60737 (arr!29227 (Array (_ BitVec 32) ValueCell!10685)) (size!29707 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60736)

(declare-fun e!549906 () Bool)

(declare-fun array_inv!22653 (array!60736) Bool)

(assert (=> start!83610 (and (array_inv!22653 _values!1425) e!549906)))

(declare-fun array_inv!22654 (array!60734) Bool)

(assert (=> start!83610 (array_inv!22654 _keys!1717)))

(declare-fun b!975523 () Bool)

(assert (=> b!975523 (= e!549906 (and e!549903 mapRes!35509))))

(declare-fun condMapEmpty!35509 () Bool)

(declare-fun mapDefault!35509 () ValueCell!10685)

(assert (=> b!975523 (= condMapEmpty!35509 (= (arr!29227 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10685)) mapDefault!35509)))))

(declare-fun b!975524 () Bool)

(declare-fun e!549904 () Bool)

(assert (=> b!975524 (= e!549904 tp_is_empty!22333)))

(declare-fun b!975525 () Bool)

(declare-fun res!652757 () Bool)

(assert (=> b!975525 (=> (not res!652757) (not e!549907))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!975525 (= res!652757 (and (= (size!29707 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29706 _keys!1717) (size!29707 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975526 () Bool)

(declare-fun res!652759 () Bool)

(assert (=> b!975526 (=> (not res!652759) (not e!549907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60734 (_ BitVec 32)) Bool)

(assert (=> b!975526 (= res!652759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35509 () Bool)

(declare-fun tp!67582 () Bool)

(assert (=> mapNonEmpty!35509 (= mapRes!35509 (and tp!67582 e!549904))))

(declare-fun mapKey!35509 () (_ BitVec 32))

(declare-fun mapRest!35509 () (Array (_ BitVec 32) ValueCell!10685))

(declare-fun mapValue!35509 () ValueCell!10685)

(assert (=> mapNonEmpty!35509 (= (arr!29227 _values!1425) (store mapRest!35509 mapKey!35509 mapValue!35509))))

(assert (= (and start!83610 res!652758) b!975525))

(assert (= (and b!975525 res!652757) b!975526))

(assert (= (and b!975526 res!652759) b!975522))

(assert (= (and b!975522 res!652760) b!975520))

(assert (= (and b!975523 condMapEmpty!35509) mapIsEmpty!35509))

(assert (= (and b!975523 (not condMapEmpty!35509)) mapNonEmpty!35509))

(get-info :version)

(assert (= (and mapNonEmpty!35509 ((_ is ValueCellFull!10685) mapValue!35509)) b!975524))

(assert (= (and b!975523 ((_ is ValueCellFull!10685) mapDefault!35509)) b!975521))

(assert (= start!83610 b!975523))

(declare-fun m!903395 () Bool)

(assert (=> b!975522 m!903395))

(declare-fun m!903397 () Bool)

(assert (=> start!83610 m!903397))

(declare-fun m!903399 () Bool)

(assert (=> start!83610 m!903399))

(declare-fun m!903401 () Bool)

(assert (=> start!83610 m!903401))

(declare-fun m!903403 () Bool)

(assert (=> b!975526 m!903403))

(declare-fun m!903405 () Bool)

(assert (=> mapNonEmpty!35509 m!903405))

(check-sat tp_is_empty!22333 (not start!83610) (not mapNonEmpty!35509) (not b!975522) (not b!975526))
(check-sat)
