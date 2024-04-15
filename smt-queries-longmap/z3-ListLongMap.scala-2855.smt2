; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41146 () Bool)

(assert start!41146)

(declare-fun b_free!11029 () Bool)

(declare-fun b_next!11029 () Bool)

(assert (=> start!41146 (= b_free!11029 (not b_next!11029))))

(declare-fun tp!38923 () Bool)

(declare-fun b_and!19271 () Bool)

(assert (=> start!41146 (= tp!38923 b_and!19271)))

(declare-fun b!459425 () Bool)

(declare-fun res!274631 () Bool)

(declare-fun e!268101 () Bool)

(assert (=> b!459425 (=> (not res!274631) (not e!268101))))

(declare-datatypes ((array!28531 0))(
  ( (array!28532 (arr!13706 (Array (_ BitVec 32) (_ BitVec 64))) (size!14059 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28531)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459425 (= res!274631 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459426 () Bool)

(declare-fun e!268100 () Bool)

(declare-fun e!268094 () Bool)

(assert (=> b!459426 (= e!268100 (not e!268094))))

(declare-fun res!274620 () Bool)

(assert (=> b!459426 (=> res!274620 e!268094)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459426 (= res!274620 (not (validKeyInArray!0 (select (arr!13706 _keys!709) from!863))))))

(declare-datatypes ((V!17595 0))(
  ( (V!17596 (val!6228 Int)) )
))
(declare-datatypes ((tuple2!8240 0))(
  ( (tuple2!8241 (_1!4131 (_ BitVec 64)) (_2!4131 V!17595)) )
))
(declare-datatypes ((List!8301 0))(
  ( (Nil!8298) (Cons!8297 (h!9153 tuple2!8240) (t!14200 List!8301)) )
))
(declare-datatypes ((ListLongMap!7143 0))(
  ( (ListLongMap!7144 (toList!3587 List!8301)) )
))
(declare-fun lt!207761 () ListLongMap!7143)

(declare-fun lt!207765 () ListLongMap!7143)

(assert (=> b!459426 (= lt!207761 lt!207765)))

(declare-fun lt!207758 () ListLongMap!7143)

(declare-fun v!412 () V!17595)

(declare-fun +!1639 (ListLongMap!7143 tuple2!8240) ListLongMap!7143)

(assert (=> b!459426 (= lt!207765 (+!1639 lt!207758 (tuple2!8241 k0!794 v!412)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17595)

(declare-datatypes ((ValueCell!5840 0))(
  ( (ValueCellFull!5840 (v!8500 V!17595)) (EmptyCell!5840) )
))
(declare-datatypes ((array!28533 0))(
  ( (array!28534 (arr!13707 (Array (_ BitVec 32) ValueCell!5840)) (size!14060 (_ BitVec 32))) )
))
(declare-fun lt!207759 () array!28533)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17595)

(declare-fun lt!207767 () array!28531)

(declare-fun getCurrentListMapNoExtraKeys!1780 (array!28531 array!28533 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) Int) ListLongMap!7143)

(assert (=> b!459426 (= lt!207761 (getCurrentListMapNoExtraKeys!1780 lt!207767 lt!207759 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28533)

(assert (=> b!459426 (= lt!207758 (getCurrentListMapNoExtraKeys!1780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13334 0))(
  ( (Unit!13335) )
))
(declare-fun lt!207764 () Unit!13334)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 (array!28531 array!28533 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) (_ BitVec 64) V!17595 (_ BitVec 32) Int) Unit!13334)

(assert (=> b!459426 (= lt!207764 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!771 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459427 () Bool)

(declare-fun res!274625 () Bool)

(assert (=> b!459427 (=> (not res!274625) (not e!268101))))

(assert (=> b!459427 (= res!274625 (and (= (size!14060 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14059 _keys!709) (size!14060 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459428 () Bool)

(declare-fun res!274633 () Bool)

(assert (=> b!459428 (=> (not res!274633) (not e!268101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459428 (= res!274633 (validMask!0 mask!1025))))

(declare-fun b!459429 () Bool)

(declare-fun e!268097 () Bool)

(assert (=> b!459429 (= e!268097 e!268100)))

(declare-fun res!274628 () Bool)

(assert (=> b!459429 (=> (not res!274628) (not e!268100))))

(assert (=> b!459429 (= res!274628 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207766 () ListLongMap!7143)

(assert (=> b!459429 (= lt!207766 (getCurrentListMapNoExtraKeys!1780 lt!207767 lt!207759 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459429 (= lt!207759 (array!28534 (store (arr!13707 _values!549) i!563 (ValueCellFull!5840 v!412)) (size!14060 _values!549)))))

(declare-fun lt!207763 () ListLongMap!7143)

(assert (=> b!459429 (= lt!207763 (getCurrentListMapNoExtraKeys!1780 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459430 () Bool)

(declare-fun res!274626 () Bool)

(assert (=> b!459430 (=> (not res!274626) (not e!268097))))

(assert (=> b!459430 (= res!274626 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!20200 () Bool)

(declare-fun mapRes!20200 () Bool)

(declare-fun tp!38922 () Bool)

(declare-fun e!268096 () Bool)

(assert (=> mapNonEmpty!20200 (= mapRes!20200 (and tp!38922 e!268096))))

(declare-fun mapValue!20200 () ValueCell!5840)

(declare-fun mapKey!20200 () (_ BitVec 32))

(declare-fun mapRest!20200 () (Array (_ BitVec 32) ValueCell!5840))

(assert (=> mapNonEmpty!20200 (= (arr!13707 _values!549) (store mapRest!20200 mapKey!20200 mapValue!20200))))

(declare-fun b!459431 () Bool)

(declare-fun res!274627 () Bool)

(assert (=> b!459431 (=> (not res!274627) (not e!268101))))

(assert (=> b!459431 (= res!274627 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14059 _keys!709))))))

(declare-fun b!459432 () Bool)

(declare-fun res!274623 () Bool)

(assert (=> b!459432 (=> (not res!274623) (not e!268101))))

(assert (=> b!459432 (= res!274623 (or (= (select (arr!13706 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13706 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459433 () Bool)

(declare-fun e!268099 () Unit!13334)

(declare-fun Unit!13336 () Unit!13334)

(assert (=> b!459433 (= e!268099 Unit!13336)))

(declare-fun b!459434 () Bool)

(declare-fun e!268098 () Bool)

(declare-fun e!268093 () Bool)

(assert (=> b!459434 (= e!268098 (and e!268093 mapRes!20200))))

(declare-fun condMapEmpty!20200 () Bool)

(declare-fun mapDefault!20200 () ValueCell!5840)

(assert (=> b!459434 (= condMapEmpty!20200 (= (arr!13707 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5840)) mapDefault!20200)))))

(declare-fun res!274632 () Bool)

(assert (=> start!41146 (=> (not res!274632) (not e!268101))))

(assert (=> start!41146 (= res!274632 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14059 _keys!709))))))

(assert (=> start!41146 e!268101))

(declare-fun tp_is_empty!12367 () Bool)

(assert (=> start!41146 tp_is_empty!12367))

(assert (=> start!41146 tp!38923))

(assert (=> start!41146 true))

(declare-fun array_inv!9978 (array!28533) Bool)

(assert (=> start!41146 (and (array_inv!9978 _values!549) e!268098)))

(declare-fun array_inv!9979 (array!28531) Bool)

(assert (=> start!41146 (array_inv!9979 _keys!709)))

(declare-fun b!459435 () Bool)

(assert (=> b!459435 (= e!268093 tp_is_empty!12367)))

(declare-fun b!459436 () Bool)

(assert (=> b!459436 (= e!268096 tp_is_empty!12367)))

(declare-fun b!459437 () Bool)

(declare-fun res!274622 () Bool)

(assert (=> b!459437 (=> (not res!274622) (not e!268101))))

(declare-datatypes ((List!8302 0))(
  ( (Nil!8299) (Cons!8298 (h!9154 (_ BitVec 64)) (t!14201 List!8302)) )
))
(declare-fun arrayNoDuplicates!0 (array!28531 (_ BitVec 32) List!8302) Bool)

(assert (=> b!459437 (= res!274622 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8299))))

(declare-fun b!459438 () Bool)

(declare-fun res!274624 () Bool)

(assert (=> b!459438 (=> (not res!274624) (not e!268097))))

(assert (=> b!459438 (= res!274624 (arrayNoDuplicates!0 lt!207767 #b00000000000000000000000000000000 Nil!8299))))

(declare-fun b!459439 () Bool)

(declare-fun Unit!13337 () Unit!13334)

(assert (=> b!459439 (= e!268099 Unit!13337)))

(declare-fun lt!207762 () Unit!13334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13334)

(assert (=> b!459439 (= lt!207762 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459439 false))

(declare-fun b!459440 () Bool)

(declare-fun res!274621 () Bool)

(assert (=> b!459440 (=> (not res!274621) (not e!268101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28531 (_ BitVec 32)) Bool)

(assert (=> b!459440 (= res!274621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459441 () Bool)

(assert (=> b!459441 (= e!268101 e!268097)))

(declare-fun res!274630 () Bool)

(assert (=> b!459441 (=> (not res!274630) (not e!268097))))

(assert (=> b!459441 (= res!274630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207767 mask!1025))))

(assert (=> b!459441 (= lt!207767 (array!28532 (store (arr!13706 _keys!709) i!563 k0!794) (size!14059 _keys!709)))))

(declare-fun b!459442 () Bool)

(assert (=> b!459442 (= e!268094 (not (= k0!794 (select (arr!13706 _keys!709) from!863))))))

(assert (=> b!459442 (not (= (select (arr!13706 _keys!709) from!863) k0!794))))

(declare-fun lt!207760 () Unit!13334)

(assert (=> b!459442 (= lt!207760 e!268099)))

(declare-fun c!56421 () Bool)

(assert (=> b!459442 (= c!56421 (= (select (arr!13706 _keys!709) from!863) k0!794))))

(declare-fun get!6766 (ValueCell!5840 V!17595) V!17595)

(declare-fun dynLambda!899 (Int (_ BitVec 64)) V!17595)

(assert (=> b!459442 (= lt!207766 (+!1639 lt!207765 (tuple2!8241 (select (arr!13706 _keys!709) from!863) (get!6766 (select (arr!13707 _values!549) from!863) (dynLambda!899 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!20200 () Bool)

(assert (=> mapIsEmpty!20200 mapRes!20200))

(declare-fun b!459443 () Bool)

(declare-fun res!274629 () Bool)

(assert (=> b!459443 (=> (not res!274629) (not e!268101))))

(assert (=> b!459443 (= res!274629 (validKeyInArray!0 k0!794))))

(assert (= (and start!41146 res!274632) b!459428))

(assert (= (and b!459428 res!274633) b!459427))

(assert (= (and b!459427 res!274625) b!459440))

(assert (= (and b!459440 res!274621) b!459437))

(assert (= (and b!459437 res!274622) b!459431))

(assert (= (and b!459431 res!274627) b!459443))

(assert (= (and b!459443 res!274629) b!459432))

(assert (= (and b!459432 res!274623) b!459425))

(assert (= (and b!459425 res!274631) b!459441))

(assert (= (and b!459441 res!274630) b!459438))

(assert (= (and b!459438 res!274624) b!459430))

(assert (= (and b!459430 res!274626) b!459429))

(assert (= (and b!459429 res!274628) b!459426))

(assert (= (and b!459426 (not res!274620)) b!459442))

(assert (= (and b!459442 c!56421) b!459439))

(assert (= (and b!459442 (not c!56421)) b!459433))

(assert (= (and b!459434 condMapEmpty!20200) mapIsEmpty!20200))

(assert (= (and b!459434 (not condMapEmpty!20200)) mapNonEmpty!20200))

(get-info :version)

(assert (= (and mapNonEmpty!20200 ((_ is ValueCellFull!5840) mapValue!20200)) b!459436))

(assert (= (and b!459434 ((_ is ValueCellFull!5840) mapDefault!20200)) b!459435))

(assert (= start!41146 b!459434))

(declare-fun b_lambda!9845 () Bool)

(assert (=> (not b_lambda!9845) (not b!459442)))

(declare-fun t!14199 () Bool)

(declare-fun tb!3857 () Bool)

(assert (=> (and start!41146 (= defaultEntry!557 defaultEntry!557) t!14199) tb!3857))

(declare-fun result!7267 () Bool)

(assert (=> tb!3857 (= result!7267 tp_is_empty!12367)))

(assert (=> b!459442 t!14199))

(declare-fun b_and!19273 () Bool)

(assert (= b_and!19271 (and (=> t!14199 result!7267) b_and!19273)))

(declare-fun m!442213 () Bool)

(assert (=> start!41146 m!442213))

(declare-fun m!442215 () Bool)

(assert (=> start!41146 m!442215))

(declare-fun m!442217 () Bool)

(assert (=> b!459426 m!442217))

(declare-fun m!442219 () Bool)

(assert (=> b!459426 m!442219))

(declare-fun m!442221 () Bool)

(assert (=> b!459426 m!442221))

(declare-fun m!442223 () Bool)

(assert (=> b!459426 m!442223))

(assert (=> b!459426 m!442217))

(declare-fun m!442225 () Bool)

(assert (=> b!459426 m!442225))

(declare-fun m!442227 () Bool)

(assert (=> b!459426 m!442227))

(declare-fun m!442229 () Bool)

(assert (=> b!459438 m!442229))

(declare-fun m!442231 () Bool)

(assert (=> mapNonEmpty!20200 m!442231))

(declare-fun m!442233 () Bool)

(assert (=> b!459425 m!442233))

(declare-fun m!442235 () Bool)

(assert (=> b!459437 m!442235))

(declare-fun m!442237 () Bool)

(assert (=> b!459428 m!442237))

(declare-fun m!442239 () Bool)

(assert (=> b!459443 m!442239))

(declare-fun m!442241 () Bool)

(assert (=> b!459441 m!442241))

(declare-fun m!442243 () Bool)

(assert (=> b!459441 m!442243))

(declare-fun m!442245 () Bool)

(assert (=> b!459440 m!442245))

(declare-fun m!442247 () Bool)

(assert (=> b!459429 m!442247))

(declare-fun m!442249 () Bool)

(assert (=> b!459429 m!442249))

(declare-fun m!442251 () Bool)

(assert (=> b!459429 m!442251))

(declare-fun m!442253 () Bool)

(assert (=> b!459432 m!442253))

(declare-fun m!442255 () Bool)

(assert (=> b!459439 m!442255))

(assert (=> b!459442 m!442217))

(declare-fun m!442257 () Bool)

(assert (=> b!459442 m!442257))

(declare-fun m!442259 () Bool)

(assert (=> b!459442 m!442259))

(declare-fun m!442261 () Bool)

(assert (=> b!459442 m!442261))

(assert (=> b!459442 m!442261))

(assert (=> b!459442 m!442257))

(declare-fun m!442263 () Bool)

(assert (=> b!459442 m!442263))

(check-sat (not b!459441) b_and!19273 (not mapNonEmpty!20200) (not b!459443) (not b_lambda!9845) (not b!459428) (not b!459437) (not b!459442) (not b!459426) (not b!459429) tp_is_empty!12367 (not start!41146) (not b!459440) (not b!459438) (not b_next!11029) (not b!459425) (not b!459439))
(check-sat b_and!19273 (not b_next!11029))
