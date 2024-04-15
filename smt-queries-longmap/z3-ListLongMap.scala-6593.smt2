; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83424 () Bool)

(assert start!83424)

(declare-fun b!974378 () Bool)

(declare-datatypes ((array!60630 0))(
  ( (array!60631 (arr!29179 (Array (_ BitVec 32) (_ BitVec 64))) (size!29660 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60630)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun e!549176 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974378 (= e!549176 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29660 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29660 _keys!1717)) (bvslt i!822 #b00000000000000000000000000000000)))))

(declare-fun b!974379 () Bool)

(declare-fun res!652306 () Bool)

(assert (=> b!974379 (=> (not res!652306) (not e!549176))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60630 (_ BitVec 32)) Bool)

(assert (=> b!974379 (= res!652306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35509 () Bool)

(declare-fun mapRes!35509 () Bool)

(declare-fun tp!67582 () Bool)

(declare-fun e!549173 () Bool)

(assert (=> mapNonEmpty!35509 (= mapRes!35509 (and tp!67582 e!549173))))

(declare-datatypes ((V!34761 0))(
  ( (V!34762 (val!11217 Int)) )
))
(declare-datatypes ((ValueCell!10685 0))(
  ( (ValueCellFull!10685 (v!13775 V!34761)) (EmptyCell!10685) )
))
(declare-datatypes ((array!60632 0))(
  ( (array!60633 (arr!29180 (Array (_ BitVec 32) ValueCell!10685)) (size!29661 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60632)

(declare-fun mapRest!35509 () (Array (_ BitVec 32) ValueCell!10685))

(declare-fun mapKey!35509 () (_ BitVec 32))

(declare-fun mapValue!35509 () ValueCell!10685)

(assert (=> mapNonEmpty!35509 (= (arr!29180 _values!1425) (store mapRest!35509 mapKey!35509 mapValue!35509))))

(declare-fun b!974380 () Bool)

(declare-fun res!652303 () Bool)

(assert (=> b!974380 (=> (not res!652303) (not e!549176))))

(declare-datatypes ((List!20292 0))(
  ( (Nil!20289) (Cons!20288 (h!21450 (_ BitVec 64)) (t!28760 List!20292)) )
))
(declare-fun arrayNoDuplicates!0 (array!60630 (_ BitVec 32) List!20292) Bool)

(assert (=> b!974380 (= res!652303 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20289))))

(declare-fun b!974381 () Bool)

(declare-fun e!549175 () Bool)

(declare-fun e!549177 () Bool)

(assert (=> b!974381 (= e!549175 (and e!549177 mapRes!35509))))

(declare-fun condMapEmpty!35509 () Bool)

(declare-fun mapDefault!35509 () ValueCell!10685)

(assert (=> b!974381 (= condMapEmpty!35509 (= (arr!29180 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10685)) mapDefault!35509)))))

(declare-fun b!974382 () Bool)

(declare-fun tp_is_empty!22333 () Bool)

(assert (=> b!974382 (= e!549177 tp_is_empty!22333)))

(declare-fun mapIsEmpty!35509 () Bool)

(assert (=> mapIsEmpty!35509 mapRes!35509))

(declare-fun b!974383 () Bool)

(assert (=> b!974383 (= e!549173 tp_is_empty!22333)))

(declare-fun b!974384 () Bool)

(declare-fun res!652305 () Bool)

(assert (=> b!974384 (=> (not res!652305) (not e!549176))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974384 (= res!652305 (and (= (size!29661 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29660 _keys!1717) (size!29661 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!652304 () Bool)

(assert (=> start!83424 (=> (not res!652304) (not e!549176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83424 (= res!652304 (validMask!0 mask!2147))))

(assert (=> start!83424 e!549176))

(assert (=> start!83424 true))

(declare-fun array_inv!22623 (array!60632) Bool)

(assert (=> start!83424 (and (array_inv!22623 _values!1425) e!549175)))

(declare-fun array_inv!22624 (array!60630) Bool)

(assert (=> start!83424 (array_inv!22624 _keys!1717)))

(assert (= (and start!83424 res!652304) b!974384))

(assert (= (and b!974384 res!652305) b!974379))

(assert (= (and b!974379 res!652306) b!974380))

(assert (= (and b!974380 res!652303) b!974378))

(assert (= (and b!974381 condMapEmpty!35509) mapIsEmpty!35509))

(assert (= (and b!974381 (not condMapEmpty!35509)) mapNonEmpty!35509))

(get-info :version)

(assert (= (and mapNonEmpty!35509 ((_ is ValueCellFull!10685) mapValue!35509)) b!974383))

(assert (= (and b!974381 ((_ is ValueCellFull!10685) mapDefault!35509)) b!974382))

(assert (= start!83424 b!974381))

(declare-fun m!901343 () Bool)

(assert (=> b!974379 m!901343))

(declare-fun m!901345 () Bool)

(assert (=> mapNonEmpty!35509 m!901345))

(declare-fun m!901347 () Bool)

(assert (=> b!974380 m!901347))

(declare-fun m!901349 () Bool)

(assert (=> start!83424 m!901349))

(declare-fun m!901351 () Bool)

(assert (=> start!83424 m!901351))

(declare-fun m!901353 () Bool)

(assert (=> start!83424 m!901353))

(check-sat tp_is_empty!22333 (not start!83424) (not b!974380) (not mapNonEmpty!35509) (not b!974379))
(check-sat)
