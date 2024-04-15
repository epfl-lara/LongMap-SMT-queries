; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20086 () Bool)

(assert start!20086)

(declare-fun b_free!4741 () Bool)

(declare-fun b_next!4741 () Bool)

(assert (=> start!20086 (= b_free!4741 (not b_next!4741))))

(declare-fun tp!17254 () Bool)

(declare-fun b_and!11461 () Bool)

(assert (=> start!20086 (= tp!17254 b_and!11461)))

(declare-fun res!92754 () Bool)

(declare-fun e!129435 () Bool)

(assert (=> start!20086 (=> (not res!92754) (not e!129435))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20086 (= res!92754 (validMask!0 mask!1149))))

(assert (=> start!20086 e!129435))

(declare-datatypes ((V!5777 0))(
  ( (V!5778 (val!2343 Int)) )
))
(declare-datatypes ((ValueCell!1955 0))(
  ( (ValueCellFull!1955 (v!4307 V!5777)) (EmptyCell!1955) )
))
(declare-datatypes ((array!8425 0))(
  ( (array!8426 (arr!3962 (Array (_ BitVec 32) ValueCell!1955)) (size!4288 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8425)

(declare-fun e!129437 () Bool)

(declare-fun array_inv!2569 (array!8425) Bool)

(assert (=> start!20086 (and (array_inv!2569 _values!649) e!129437)))

(assert (=> start!20086 true))

(declare-fun tp_is_empty!4597 () Bool)

(assert (=> start!20086 tp_is_empty!4597))

(declare-datatypes ((array!8427 0))(
  ( (array!8428 (arr!3963 (Array (_ BitVec 32) (_ BitVec 64))) (size!4289 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8427)

(declare-fun array_inv!2570 (array!8427) Bool)

(assert (=> start!20086 (array_inv!2570 _keys!825)))

(assert (=> start!20086 tp!17254))

(declare-fun b!196517 () Bool)

(declare-fun res!92750 () Bool)

(assert (=> b!196517 (=> (not res!92750) (not e!129435))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196517 (= res!92750 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4289 _keys!825))))))

(declare-fun b!196518 () Bool)

(declare-fun e!129434 () Bool)

(declare-fun mapRes!7964 () Bool)

(assert (=> b!196518 (= e!129437 (and e!129434 mapRes!7964))))

(declare-fun condMapEmpty!7964 () Bool)

(declare-fun mapDefault!7964 () ValueCell!1955)

(assert (=> b!196518 (= condMapEmpty!7964 (= (arr!3962 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1955)) mapDefault!7964)))))

(declare-fun b!196519 () Bool)

(assert (=> b!196519 (= e!129434 tp_is_empty!4597)))

(declare-fun b!196520 () Bool)

(declare-fun res!92752 () Bool)

(assert (=> b!196520 (=> (not res!92752) (not e!129435))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196520 (= res!92752 (and (= (size!4288 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4289 _keys!825) (size!4288 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7964 () Bool)

(assert (=> mapIsEmpty!7964 mapRes!7964))

(declare-fun b!196521 () Bool)

(declare-fun res!92756 () Bool)

(assert (=> b!196521 (=> (not res!92756) (not e!129435))))

(declare-datatypes ((List!2457 0))(
  ( (Nil!2454) (Cons!2453 (h!3095 (_ BitVec 64)) (t!7379 List!2457)) )
))
(declare-fun arrayNoDuplicates!0 (array!8427 (_ BitVec 32) List!2457) Bool)

(assert (=> b!196521 (= res!92756 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2454))))

(declare-fun b!196522 () Bool)

(declare-fun res!92753 () Bool)

(assert (=> b!196522 (=> (not res!92753) (not e!129435))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196522 (= res!92753 (validKeyInArray!0 k0!843))))

(declare-fun b!196523 () Bool)

(declare-fun res!92751 () Bool)

(assert (=> b!196523 (=> (not res!92751) (not e!129435))))

(assert (=> b!196523 (= res!92751 (= (select (arr!3963 _keys!825) i!601) k0!843))))

(declare-fun b!196524 () Bool)

(assert (=> b!196524 (= e!129435 false)))

(declare-datatypes ((tuple2!3526 0))(
  ( (tuple2!3527 (_1!1774 (_ BitVec 64)) (_2!1774 V!5777)) )
))
(declare-datatypes ((List!2458 0))(
  ( (Nil!2455) (Cons!2454 (h!3096 tuple2!3526) (t!7380 List!2458)) )
))
(declare-datatypes ((ListLongMap!2429 0))(
  ( (ListLongMap!2430 (toList!1230 List!2458)) )
))
(declare-fun lt!97460 () ListLongMap!2429)

(declare-fun zeroValue!615 () V!5777)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5777)

(declare-fun getCurrentListMapNoExtraKeys!210 (array!8427 array!8425 (_ BitVec 32) (_ BitVec 32) V!5777 V!5777 (_ BitVec 32) Int) ListLongMap!2429)

(assert (=> b!196524 (= lt!97460 (getCurrentListMapNoExtraKeys!210 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196525 () Bool)

(declare-fun e!129438 () Bool)

(assert (=> b!196525 (= e!129438 tp_is_empty!4597)))

(declare-fun b!196526 () Bool)

(declare-fun res!92755 () Bool)

(assert (=> b!196526 (=> (not res!92755) (not e!129435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8427 (_ BitVec 32)) Bool)

(assert (=> b!196526 (= res!92755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7964 () Bool)

(declare-fun tp!17255 () Bool)

(assert (=> mapNonEmpty!7964 (= mapRes!7964 (and tp!17255 e!129438))))

(declare-fun mapValue!7964 () ValueCell!1955)

(declare-fun mapRest!7964 () (Array (_ BitVec 32) ValueCell!1955))

(declare-fun mapKey!7964 () (_ BitVec 32))

(assert (=> mapNonEmpty!7964 (= (arr!3962 _values!649) (store mapRest!7964 mapKey!7964 mapValue!7964))))

(assert (= (and start!20086 res!92754) b!196520))

(assert (= (and b!196520 res!92752) b!196526))

(assert (= (and b!196526 res!92755) b!196521))

(assert (= (and b!196521 res!92756) b!196517))

(assert (= (and b!196517 res!92750) b!196522))

(assert (= (and b!196522 res!92753) b!196523))

(assert (= (and b!196523 res!92751) b!196524))

(assert (= (and b!196518 condMapEmpty!7964) mapIsEmpty!7964))

(assert (= (and b!196518 (not condMapEmpty!7964)) mapNonEmpty!7964))

(get-info :version)

(assert (= (and mapNonEmpty!7964 ((_ is ValueCellFull!1955) mapValue!7964)) b!196525))

(assert (= (and b!196518 ((_ is ValueCellFull!1955) mapDefault!7964)) b!196519))

(assert (= start!20086 b!196518))

(declare-fun m!223239 () Bool)

(assert (=> b!196523 m!223239))

(declare-fun m!223241 () Bool)

(assert (=> start!20086 m!223241))

(declare-fun m!223243 () Bool)

(assert (=> start!20086 m!223243))

(declare-fun m!223245 () Bool)

(assert (=> start!20086 m!223245))

(declare-fun m!223247 () Bool)

(assert (=> b!196522 m!223247))

(declare-fun m!223249 () Bool)

(assert (=> b!196521 m!223249))

(declare-fun m!223251 () Bool)

(assert (=> b!196524 m!223251))

(declare-fun m!223253 () Bool)

(assert (=> mapNonEmpty!7964 m!223253))

(declare-fun m!223255 () Bool)

(assert (=> b!196526 m!223255))

(check-sat (not b!196524) (not mapNonEmpty!7964) (not b!196522) tp_is_empty!4597 (not b!196521) (not b_next!4741) (not start!20086) (not b!196526) b_and!11461)
(check-sat b_and!11461 (not b_next!4741))
