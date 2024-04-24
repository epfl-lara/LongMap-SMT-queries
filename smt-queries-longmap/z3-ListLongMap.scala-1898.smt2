; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33864 () Bool)

(assert start!33864)

(declare-fun b_free!7057 () Bool)

(declare-fun b_next!7057 () Bool)

(assert (=> start!33864 (= b_free!7057 (not b_next!7057))))

(declare-fun tp!24684 () Bool)

(declare-fun b_and!14257 () Bool)

(assert (=> start!33864 (= tp!24684 b_and!14257)))

(declare-fun mapNonEmpty!11919 () Bool)

(declare-fun mapRes!11919 () Bool)

(declare-fun tp!24683 () Bool)

(declare-fun e!206935 () Bool)

(assert (=> mapNonEmpty!11919 (= mapRes!11919 (and tp!24683 e!206935))))

(declare-datatypes ((V!10323 0))(
  ( (V!10324 (val!3549 Int)) )
))
(declare-datatypes ((ValueCell!3161 0))(
  ( (ValueCellFull!3161 (v!5715 V!10323)) (EmptyCell!3161) )
))
(declare-fun mapRest!11919 () (Array (_ BitVec 32) ValueCell!3161))

(declare-fun mapKey!11919 () (_ BitVec 32))

(declare-datatypes ((array!17598 0))(
  ( (array!17599 (arr!8326 (Array (_ BitVec 32) ValueCell!3161)) (size!8678 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17598)

(declare-fun mapValue!11919 () ValueCell!3161)

(assert (=> mapNonEmpty!11919 (= (arr!8326 _values!1525) (store mapRest!11919 mapKey!11919 mapValue!11919))))

(declare-fun b!337207 () Bool)

(declare-fun res!186264 () Bool)

(declare-fun e!206931 () Bool)

(assert (=> b!337207 (=> (not res!186264) (not e!206931))))

(declare-datatypes ((array!17600 0))(
  ( (array!17601 (arr!8327 (Array (_ BitVec 32) (_ BitVec 64))) (size!8679 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17600)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17600 (_ BitVec 32)) Bool)

(assert (=> b!337207 (= res!186264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337208 () Bool)

(declare-fun res!186268 () Bool)

(assert (=> b!337208 (=> (not res!186268) (not e!206931))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337208 (= res!186268 (and (= (size!8678 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8679 _keys!1895) (size!8678 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337209 () Bool)

(declare-fun tp_is_empty!7009 () Bool)

(assert (=> b!337209 (= e!206935 tp_is_empty!7009)))

(declare-fun b!337210 () Bool)

(declare-fun e!206934 () Bool)

(assert (=> b!337210 (= e!206931 e!206934)))

(declare-fun res!186265 () Bool)

(assert (=> b!337210 (=> (not res!186265) (not e!206934))))

(declare-datatypes ((SeekEntryResult!3179 0))(
  ( (MissingZero!3179 (index!14895 (_ BitVec 32))) (Found!3179 (index!14896 (_ BitVec 32))) (Intermediate!3179 (undefined!3991 Bool) (index!14897 (_ BitVec 32)) (x!33572 (_ BitVec 32))) (Undefined!3179) (MissingVacant!3179 (index!14898 (_ BitVec 32))) )
))
(declare-fun lt!160420 () SeekEntryResult!3179)

(get-info :version)

(assert (=> b!337210 (= res!186265 (and (not ((_ is Found!3179) lt!160420)) ((_ is MissingZero!3179) lt!160420)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17600 (_ BitVec 32)) SeekEntryResult!3179)

(assert (=> b!337210 (= lt!160420 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11919 () Bool)

(assert (=> mapIsEmpty!11919 mapRes!11919))

(declare-fun b!337211 () Bool)

(declare-fun e!206932 () Bool)

(assert (=> b!337211 (= e!206932 tp_is_empty!7009)))

(declare-fun b!337212 () Bool)

(declare-fun res!186267 () Bool)

(assert (=> b!337212 (=> (not res!186267) (not e!206931))))

(declare-datatypes ((List!4682 0))(
  ( (Nil!4679) (Cons!4678 (h!5534 (_ BitVec 64)) (t!9768 List!4682)) )
))
(declare-fun arrayNoDuplicates!0 (array!17600 (_ BitVec 32) List!4682) Bool)

(assert (=> b!337212 (= res!186267 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4679))))

(declare-fun b!337213 () Bool)

(declare-fun res!186266 () Bool)

(assert (=> b!337213 (=> (not res!186266) (not e!206934))))

(declare-fun arrayContainsKey!0 (array!17600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337213 (= res!186266 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186262 () Bool)

(assert (=> start!33864 (=> (not res!186262) (not e!206931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33864 (= res!186262 (validMask!0 mask!2385))))

(assert (=> start!33864 e!206931))

(assert (=> start!33864 true))

(assert (=> start!33864 tp_is_empty!7009))

(assert (=> start!33864 tp!24684))

(declare-fun e!206936 () Bool)

(declare-fun array_inv!6188 (array!17598) Bool)

(assert (=> start!33864 (and (array_inv!6188 _values!1525) e!206936)))

(declare-fun array_inv!6189 (array!17600) Bool)

(assert (=> start!33864 (array_inv!6189 _keys!1895)))

(declare-fun b!337214 () Bool)

(assert (=> b!337214 (= e!206934 false)))

(declare-fun lt!160419 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17600 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337214 (= lt!160419 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337215 () Bool)

(declare-fun res!186263 () Bool)

(assert (=> b!337215 (=> (not res!186263) (not e!206931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337215 (= res!186263 (validKeyInArray!0 k0!1348))))

(declare-fun b!337216 () Bool)

(assert (=> b!337216 (= e!206936 (and e!206932 mapRes!11919))))

(declare-fun condMapEmpty!11919 () Bool)

(declare-fun mapDefault!11919 () ValueCell!3161)

(assert (=> b!337216 (= condMapEmpty!11919 (= (arr!8326 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3161)) mapDefault!11919)))))

(declare-fun b!337217 () Bool)

(declare-fun res!186269 () Bool)

(assert (=> b!337217 (=> (not res!186269) (not e!206931))))

(declare-fun zeroValue!1467 () V!10323)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10323)

(declare-datatypes ((tuple2!5070 0))(
  ( (tuple2!5071 (_1!2546 (_ BitVec 64)) (_2!2546 V!10323)) )
))
(declare-datatypes ((List!4683 0))(
  ( (Nil!4680) (Cons!4679 (h!5535 tuple2!5070) (t!9769 List!4683)) )
))
(declare-datatypes ((ListLongMap!3985 0))(
  ( (ListLongMap!3986 (toList!2008 List!4683)) )
))
(declare-fun contains!2074 (ListLongMap!3985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1537 (array!17600 array!17598 (_ BitVec 32) (_ BitVec 32) V!10323 V!10323 (_ BitVec 32) Int) ListLongMap!3985)

(assert (=> b!337217 (= res!186269 (not (contains!2074 (getCurrentListMap!1537 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33864 res!186262) b!337208))

(assert (= (and b!337208 res!186268) b!337207))

(assert (= (and b!337207 res!186264) b!337212))

(assert (= (and b!337212 res!186267) b!337215))

(assert (= (and b!337215 res!186263) b!337217))

(assert (= (and b!337217 res!186269) b!337210))

(assert (= (and b!337210 res!186265) b!337213))

(assert (= (and b!337213 res!186266) b!337214))

(assert (= (and b!337216 condMapEmpty!11919) mapIsEmpty!11919))

(assert (= (and b!337216 (not condMapEmpty!11919)) mapNonEmpty!11919))

(assert (= (and mapNonEmpty!11919 ((_ is ValueCellFull!3161) mapValue!11919)) b!337209))

(assert (= (and b!337216 ((_ is ValueCellFull!3161) mapDefault!11919)) b!337211))

(assert (= start!33864 b!337216))

(declare-fun m!341059 () Bool)

(assert (=> start!33864 m!341059))

(declare-fun m!341061 () Bool)

(assert (=> start!33864 m!341061))

(declare-fun m!341063 () Bool)

(assert (=> start!33864 m!341063))

(declare-fun m!341065 () Bool)

(assert (=> mapNonEmpty!11919 m!341065))

(declare-fun m!341067 () Bool)

(assert (=> b!337212 m!341067))

(declare-fun m!341069 () Bool)

(assert (=> b!337210 m!341069))

(declare-fun m!341071 () Bool)

(assert (=> b!337207 m!341071))

(declare-fun m!341073 () Bool)

(assert (=> b!337217 m!341073))

(assert (=> b!337217 m!341073))

(declare-fun m!341075 () Bool)

(assert (=> b!337217 m!341075))

(declare-fun m!341077 () Bool)

(assert (=> b!337213 m!341077))

(declare-fun m!341079 () Bool)

(assert (=> b!337215 m!341079))

(declare-fun m!341081 () Bool)

(assert (=> b!337214 m!341081))

(check-sat (not mapNonEmpty!11919) (not start!33864) (not b!337214) (not b!337210) (not b!337217) (not b!337215) (not b!337212) tp_is_empty!7009 (not b_next!7057) (not b!337207) b_and!14257 (not b!337213))
(check-sat b_and!14257 (not b_next!7057))
