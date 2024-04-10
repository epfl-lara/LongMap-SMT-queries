; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41230 () Bool)

(assert start!41230)

(declare-fun b_free!11073 () Bool)

(declare-fun b_next!11073 () Bool)

(assert (=> start!41230 (= b_free!11073 (not b_next!11073))))

(declare-fun tp!39057 () Bool)

(declare-fun b_and!19393 () Bool)

(assert (=> start!41230 (= tp!39057 b_and!19393)))

(declare-fun mapNonEmpty!20269 () Bool)

(declare-fun mapRes!20269 () Bool)

(declare-fun tp!39058 () Bool)

(declare-fun e!268987 () Bool)

(assert (=> mapNonEmpty!20269 (= mapRes!20269 (and tp!39058 e!268987))))

(declare-datatypes ((V!17653 0))(
  ( (V!17654 (val!6250 Int)) )
))
(declare-datatypes ((ValueCell!5862 0))(
  ( (ValueCellFull!5862 (v!8532 V!17653)) (EmptyCell!5862) )
))
(declare-datatypes ((array!28621 0))(
  ( (array!28622 (arr!13750 (Array (_ BitVec 32) ValueCell!5862)) (size!14102 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28621)

(declare-fun mapKey!20269 () (_ BitVec 32))

(declare-fun mapValue!20269 () ValueCell!5862)

(declare-fun mapRest!20269 () (Array (_ BitVec 32) ValueCell!5862))

(assert (=> mapNonEmpty!20269 (= (arr!13750 _values!549) (store mapRest!20269 mapKey!20269 mapValue!20269))))

(declare-fun b!461146 () Bool)

(declare-fun tp_is_empty!12411 () Bool)

(assert (=> b!461146 (= e!268987 tp_is_empty!12411)))

(declare-fun b!461147 () Bool)

(declare-fun e!268982 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461147 (= e!268982 (bvslt i!563 (size!14102 _values!549)))))

(declare-fun b!461148 () Bool)

(declare-fun e!268981 () Bool)

(assert (=> b!461148 (= e!268981 tp_is_empty!12411)))

(declare-fun b!461149 () Bool)

(declare-fun e!268985 () Bool)

(assert (=> b!461149 (= e!268985 (and e!268981 mapRes!20269))))

(declare-fun condMapEmpty!20269 () Bool)

(declare-fun mapDefault!20269 () ValueCell!5862)

(assert (=> b!461149 (= condMapEmpty!20269 (= (arr!13750 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5862)) mapDefault!20269)))))

(declare-fun b!461150 () Bool)

(declare-fun res!275777 () Bool)

(declare-fun e!268986 () Bool)

(assert (=> b!461150 (=> (not res!275777) (not e!268986))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461150 (= res!275777 (validMask!0 mask!1025))))

(declare-fun b!461151 () Bool)

(declare-fun e!268983 () Bool)

(declare-fun e!268988 () Bool)

(assert (=> b!461151 (= e!268983 e!268988)))

(declare-fun res!275786 () Bool)

(assert (=> b!461151 (=> (not res!275786) (not e!268988))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461151 (= res!275786 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17653)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28623 0))(
  ( (array!28624 (arr!13751 (Array (_ BitVec 32) (_ BitVec 64))) (size!14103 (_ BitVec 32))) )
))
(declare-fun lt!208900 () array!28623)

(declare-fun zeroValue!515 () V!17653)

(declare-datatypes ((tuple2!8248 0))(
  ( (tuple2!8249 (_1!4135 (_ BitVec 64)) (_2!4135 V!17653)) )
))
(declare-datatypes ((List!8319 0))(
  ( (Nil!8316) (Cons!8315 (h!9171 tuple2!8248) (t!14261 List!8319)) )
))
(declare-datatypes ((ListLongMap!7161 0))(
  ( (ListLongMap!7162 (toList!3596 List!8319)) )
))
(declare-fun lt!208898 () ListLongMap!7161)

(declare-fun lt!208899 () array!28621)

(declare-fun getCurrentListMapNoExtraKeys!1776 (array!28623 array!28621 (_ BitVec 32) (_ BitVec 32) V!17653 V!17653 (_ BitVec 32) Int) ListLongMap!7161)

(assert (=> b!461151 (= lt!208898 (getCurrentListMapNoExtraKeys!1776 lt!208900 lt!208899 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17653)

(assert (=> b!461151 (= lt!208899 (array!28622 (store (arr!13750 _values!549) i!563 (ValueCellFull!5862 v!412)) (size!14102 _values!549)))))

(declare-fun lt!208901 () ListLongMap!7161)

(declare-fun _keys!709 () array!28623)

(assert (=> b!461151 (= lt!208901 (getCurrentListMapNoExtraKeys!1776 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461152 () Bool)

(declare-fun res!275783 () Bool)

(assert (=> b!461152 (=> (not res!275783) (not e!268986))))

(assert (=> b!461152 (= res!275783 (or (= (select (arr!13751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461153 () Bool)

(assert (=> b!461153 (= e!268986 e!268983)))

(declare-fun res!275789 () Bool)

(assert (=> b!461153 (=> (not res!275789) (not e!268983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28623 (_ BitVec 32)) Bool)

(assert (=> b!461153 (= res!275789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208900 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!461153 (= lt!208900 (array!28624 (store (arr!13751 _keys!709) i!563 k0!794) (size!14103 _keys!709)))))

(declare-fun b!461154 () Bool)

(declare-fun res!275787 () Bool)

(assert (=> b!461154 (=> (not res!275787) (not e!268983))))

(declare-datatypes ((List!8320 0))(
  ( (Nil!8317) (Cons!8316 (h!9172 (_ BitVec 64)) (t!14262 List!8320)) )
))
(declare-fun arrayNoDuplicates!0 (array!28623 (_ BitVec 32) List!8320) Bool)

(assert (=> b!461154 (= res!275787 (arrayNoDuplicates!0 lt!208900 #b00000000000000000000000000000000 Nil!8317))))

(declare-fun b!461155 () Bool)

(assert (=> b!461155 (= e!268988 (not e!268982))))

(declare-fun res!275785 () Bool)

(assert (=> b!461155 (=> res!275785 e!268982)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461155 (= res!275785 (validKeyInArray!0 (select (arr!13751 _keys!709) from!863)))))

(declare-fun +!1631 (ListLongMap!7161 tuple2!8248) ListLongMap!7161)

(assert (=> b!461155 (= (getCurrentListMapNoExtraKeys!1776 lt!208900 lt!208899 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1631 (getCurrentListMapNoExtraKeys!1776 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8249 k0!794 v!412)))))

(declare-datatypes ((Unit!13428 0))(
  ( (Unit!13429) )
))
(declare-fun lt!208902 () Unit!13428)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 (array!28623 array!28621 (_ BitVec 32) (_ BitVec 32) V!17653 V!17653 (_ BitVec 32) (_ BitVec 64) V!17653 (_ BitVec 32) Int) Unit!13428)

(assert (=> b!461155 (= lt!208902 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!20269 () Bool)

(assert (=> mapIsEmpty!20269 mapRes!20269))

(declare-fun b!461156 () Bool)

(declare-fun res!275781 () Bool)

(assert (=> b!461156 (=> (not res!275781) (not e!268986))))

(assert (=> b!461156 (= res!275781 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8317))))

(declare-fun b!461157 () Bool)

(declare-fun res!275778 () Bool)

(assert (=> b!461157 (=> (not res!275778) (not e!268986))))

(assert (=> b!461157 (= res!275778 (validKeyInArray!0 k0!794))))

(declare-fun res!275780 () Bool)

(assert (=> start!41230 (=> (not res!275780) (not e!268986))))

(assert (=> start!41230 (= res!275780 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14103 _keys!709))))))

(assert (=> start!41230 e!268986))

(assert (=> start!41230 tp_is_empty!12411))

(assert (=> start!41230 tp!39057))

(assert (=> start!41230 true))

(declare-fun array_inv!9946 (array!28621) Bool)

(assert (=> start!41230 (and (array_inv!9946 _values!549) e!268985)))

(declare-fun array_inv!9947 (array!28623) Bool)

(assert (=> start!41230 (array_inv!9947 _keys!709)))

(declare-fun b!461145 () Bool)

(declare-fun res!275784 () Bool)

(assert (=> b!461145 (=> (not res!275784) (not e!268986))))

(assert (=> b!461145 (= res!275784 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14103 _keys!709))))))

(declare-fun b!461158 () Bool)

(declare-fun res!275788 () Bool)

(assert (=> b!461158 (=> (not res!275788) (not e!268986))))

(declare-fun arrayContainsKey!0 (array!28623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461158 (= res!275788 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461159 () Bool)

(declare-fun res!275779 () Bool)

(assert (=> b!461159 (=> (not res!275779) (not e!268986))))

(assert (=> b!461159 (= res!275779 (and (= (size!14102 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14103 _keys!709) (size!14102 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461160 () Bool)

(declare-fun res!275776 () Bool)

(assert (=> b!461160 (=> (not res!275776) (not e!268986))))

(assert (=> b!461160 (= res!275776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461161 () Bool)

(declare-fun res!275782 () Bool)

(assert (=> b!461161 (=> (not res!275782) (not e!268983))))

(assert (=> b!461161 (= res!275782 (bvsle from!863 i!563))))

(assert (= (and start!41230 res!275780) b!461150))

(assert (= (and b!461150 res!275777) b!461159))

(assert (= (and b!461159 res!275779) b!461160))

(assert (= (and b!461160 res!275776) b!461156))

(assert (= (and b!461156 res!275781) b!461145))

(assert (= (and b!461145 res!275784) b!461157))

(assert (= (and b!461157 res!275778) b!461152))

(assert (= (and b!461152 res!275783) b!461158))

(assert (= (and b!461158 res!275788) b!461153))

(assert (= (and b!461153 res!275789) b!461154))

(assert (= (and b!461154 res!275787) b!461161))

(assert (= (and b!461161 res!275782) b!461151))

(assert (= (and b!461151 res!275786) b!461155))

(assert (= (and b!461155 (not res!275785)) b!461147))

(assert (= (and b!461149 condMapEmpty!20269) mapIsEmpty!20269))

(assert (= (and b!461149 (not condMapEmpty!20269)) mapNonEmpty!20269))

(get-info :version)

(assert (= (and mapNonEmpty!20269 ((_ is ValueCellFull!5862) mapValue!20269)) b!461146))

(assert (= (and b!461149 ((_ is ValueCellFull!5862) mapDefault!20269)) b!461148))

(assert (= start!41230 b!461149))

(declare-fun m!444357 () Bool)

(assert (=> b!461156 m!444357))

(declare-fun m!444359 () Bool)

(assert (=> b!461157 m!444359))

(declare-fun m!444361 () Bool)

(assert (=> mapNonEmpty!20269 m!444361))

(declare-fun m!444363 () Bool)

(assert (=> b!461158 m!444363))

(declare-fun m!444365 () Bool)

(assert (=> b!461153 m!444365))

(declare-fun m!444367 () Bool)

(assert (=> b!461153 m!444367))

(declare-fun m!444369 () Bool)

(assert (=> start!41230 m!444369))

(declare-fun m!444371 () Bool)

(assert (=> start!41230 m!444371))

(declare-fun m!444373 () Bool)

(assert (=> b!461151 m!444373))

(declare-fun m!444375 () Bool)

(assert (=> b!461151 m!444375))

(declare-fun m!444377 () Bool)

(assert (=> b!461151 m!444377))

(declare-fun m!444379 () Bool)

(assert (=> b!461155 m!444379))

(declare-fun m!444381 () Bool)

(assert (=> b!461155 m!444381))

(assert (=> b!461155 m!444381))

(declare-fun m!444383 () Bool)

(assert (=> b!461155 m!444383))

(assert (=> b!461155 m!444379))

(declare-fun m!444385 () Bool)

(assert (=> b!461155 m!444385))

(declare-fun m!444387 () Bool)

(assert (=> b!461155 m!444387))

(declare-fun m!444389 () Bool)

(assert (=> b!461155 m!444389))

(declare-fun m!444391 () Bool)

(assert (=> b!461150 m!444391))

(declare-fun m!444393 () Bool)

(assert (=> b!461154 m!444393))

(declare-fun m!444395 () Bool)

(assert (=> b!461160 m!444395))

(declare-fun m!444397 () Bool)

(assert (=> b!461152 m!444397))

(check-sat (not b!461155) b_and!19393 (not b!461156) (not mapNonEmpty!20269) (not b!461151) tp_is_empty!12411 (not b!461157) (not b!461150) (not b_next!11073) (not b!461158) (not b!461153) (not b!461154) (not start!41230) (not b!461160))
(check-sat b_and!19393 (not b_next!11073))
