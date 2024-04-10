; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43286 () Bool)

(assert start!43286)

(declare-fun b_free!12153 () Bool)

(declare-fun b_next!12153 () Bool)

(assert (=> start!43286 (= b_free!12153 (not b_next!12153))))

(declare-fun tp!42729 () Bool)

(declare-fun b_and!20905 () Bool)

(assert (=> start!43286 (= tp!42729 b_and!20905)))

(declare-fun b!479573 () Bool)

(declare-fun e!282163 () Bool)

(declare-fun tp_is_empty!13665 () Bool)

(assert (=> b!479573 (= e!282163 tp_is_empty!13665)))

(declare-fun b!479574 () Bool)

(declare-fun e!282164 () Bool)

(declare-fun mapRes!22195 () Bool)

(assert (=> b!479574 (= e!282164 (and e!282163 mapRes!22195))))

(declare-fun condMapEmpty!22195 () Bool)

(declare-datatypes ((V!19291 0))(
  ( (V!19292 (val!6880 Int)) )
))
(declare-datatypes ((ValueCell!6471 0))(
  ( (ValueCellFull!6471 (v!9169 V!19291)) (EmptyCell!6471) )
))
(declare-datatypes ((array!31001 0))(
  ( (array!31002 (arr!14907 (Array (_ BitVec 32) ValueCell!6471)) (size!15265 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31001)

(declare-fun mapDefault!22195 () ValueCell!6471)

(assert (=> b!479574 (= condMapEmpty!22195 (= (arr!14907 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6471)) mapDefault!22195)))))

(declare-fun b!479575 () Bool)

(declare-fun e!282165 () Bool)

(assert (=> b!479575 (= e!282165 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217882 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19291)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19291)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31003 0))(
  ( (array!31004 (arr!14908 (Array (_ BitVec 32) (_ BitVec 64))) (size!15266 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31003)

(declare-datatypes ((tuple2!9030 0))(
  ( (tuple2!9031 (_1!4526 (_ BitVec 64)) (_2!4526 V!19291)) )
))
(declare-datatypes ((List!9108 0))(
  ( (Nil!9105) (Cons!9104 (h!9960 tuple2!9030) (t!15314 List!9108)) )
))
(declare-datatypes ((ListLongMap!7943 0))(
  ( (ListLongMap!7944 (toList!3987 List!9108)) )
))
(declare-fun contains!2597 (ListLongMap!7943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2306 (array!31003 array!31001 (_ BitVec 32) (_ BitVec 32) V!19291 V!19291 (_ BitVec 32) Int) ListLongMap!7943)

(assert (=> b!479575 (= lt!217882 (contains!2597 (getCurrentListMap!2306 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479576 () Bool)

(declare-fun res!286066 () Bool)

(assert (=> b!479576 (=> (not res!286066) (not e!282165))))

(declare-datatypes ((List!9109 0))(
  ( (Nil!9106) (Cons!9105 (h!9961 (_ BitVec 64)) (t!15315 List!9109)) )
))
(declare-fun arrayNoDuplicates!0 (array!31003 (_ BitVec 32) List!9109) Bool)

(assert (=> b!479576 (= res!286066 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9106))))

(declare-fun mapIsEmpty!22195 () Bool)

(assert (=> mapIsEmpty!22195 mapRes!22195))

(declare-fun res!286065 () Bool)

(assert (=> start!43286 (=> (not res!286065) (not e!282165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43286 (= res!286065 (validMask!0 mask!2352))))

(assert (=> start!43286 e!282165))

(assert (=> start!43286 true))

(assert (=> start!43286 tp_is_empty!13665))

(declare-fun array_inv!10754 (array!31001) Bool)

(assert (=> start!43286 (and (array_inv!10754 _values!1516) e!282164)))

(assert (=> start!43286 tp!42729))

(declare-fun array_inv!10755 (array!31003) Bool)

(assert (=> start!43286 (array_inv!10755 _keys!1874)))

(declare-fun b!479577 () Bool)

(declare-fun e!282161 () Bool)

(assert (=> b!479577 (= e!282161 tp_is_empty!13665)))

(declare-fun mapNonEmpty!22195 () Bool)

(declare-fun tp!42730 () Bool)

(assert (=> mapNonEmpty!22195 (= mapRes!22195 (and tp!42730 e!282161))))

(declare-fun mapRest!22195 () (Array (_ BitVec 32) ValueCell!6471))

(declare-fun mapValue!22195 () ValueCell!6471)

(declare-fun mapKey!22195 () (_ BitVec 32))

(assert (=> mapNonEmpty!22195 (= (arr!14907 _values!1516) (store mapRest!22195 mapKey!22195 mapValue!22195))))

(declare-fun b!479578 () Bool)

(declare-fun res!286067 () Bool)

(assert (=> b!479578 (=> (not res!286067) (not e!282165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31003 (_ BitVec 32)) Bool)

(assert (=> b!479578 (= res!286067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479579 () Bool)

(declare-fun res!286068 () Bool)

(assert (=> b!479579 (=> (not res!286068) (not e!282165))))

(assert (=> b!479579 (= res!286068 (and (= (size!15265 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15266 _keys!1874) (size!15265 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43286 res!286065) b!479579))

(assert (= (and b!479579 res!286068) b!479578))

(assert (= (and b!479578 res!286067) b!479576))

(assert (= (and b!479576 res!286066) b!479575))

(assert (= (and b!479574 condMapEmpty!22195) mapIsEmpty!22195))

(assert (= (and b!479574 (not condMapEmpty!22195)) mapNonEmpty!22195))

(get-info :version)

(assert (= (and mapNonEmpty!22195 ((_ is ValueCellFull!6471) mapValue!22195)) b!479577))

(assert (= (and b!479574 ((_ is ValueCellFull!6471) mapDefault!22195)) b!479573))

(assert (= start!43286 b!479574))

(declare-fun m!461487 () Bool)

(assert (=> mapNonEmpty!22195 m!461487))

(declare-fun m!461489 () Bool)

(assert (=> b!479575 m!461489))

(assert (=> b!479575 m!461489))

(declare-fun m!461491 () Bool)

(assert (=> b!479575 m!461491))

(declare-fun m!461493 () Bool)

(assert (=> b!479578 m!461493))

(declare-fun m!461495 () Bool)

(assert (=> start!43286 m!461495))

(declare-fun m!461497 () Bool)

(assert (=> start!43286 m!461497))

(declare-fun m!461499 () Bool)

(assert (=> start!43286 m!461499))

(declare-fun m!461501 () Bool)

(assert (=> b!479576 m!461501))

(check-sat (not start!43286) (not b!479576) (not mapNonEmpty!22195) (not b!479575) tp_is_empty!13665 b_and!20905 (not b_next!12153) (not b!479578))
(check-sat b_and!20905 (not b_next!12153))
