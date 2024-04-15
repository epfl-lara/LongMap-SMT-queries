; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34692 () Bool)

(assert start!34692)

(declare-fun b_free!7513 () Bool)

(declare-fun b_next!7513 () Bool)

(assert (=> start!34692 (= b_free!7513 (not b_next!7513))))

(declare-fun tp!26103 () Bool)

(declare-fun b_and!14707 () Bool)

(assert (=> start!34692 (= tp!26103 b_and!14707)))

(declare-fun b!346605 () Bool)

(declare-fun res!191796 () Bool)

(declare-fun e!212402 () Bool)

(assert (=> b!346605 (=> (not res!191796) (not e!212402))))

(declare-datatypes ((array!18507 0))(
  ( (array!18508 (arr!8764 (Array (_ BitVec 32) (_ BitVec 64))) (size!9117 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18507)

(declare-datatypes ((List!5040 0))(
  ( (Nil!5037) (Cons!5036 (h!5892 (_ BitVec 64)) (t!10159 List!5040)) )
))
(declare-fun arrayNoDuplicates!0 (array!18507 (_ BitVec 32) List!5040) Bool)

(assert (=> b!346605 (= res!191796 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5037))))

(declare-fun b!346606 () Bool)

(declare-fun res!191797 () Bool)

(assert (=> b!346606 (=> (not res!191797) (not e!212402))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18507 (_ BitVec 32)) Bool)

(assert (=> b!346606 (= res!191797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346607 () Bool)

(declare-fun e!212403 () Bool)

(declare-fun tp_is_empty!7465 () Bool)

(assert (=> b!346607 (= e!212403 tp_is_empty!7465)))

(declare-fun b!346608 () Bool)

(declare-fun res!191794 () Bool)

(declare-fun e!212400 () Bool)

(assert (=> b!346608 (=> (not res!191794) (not e!212400))))

(declare-datatypes ((SeekEntryResult!3375 0))(
  ( (MissingZero!3375 (index!15679 (_ BitVec 32))) (Found!3375 (index!15680 (_ BitVec 32))) (Intermediate!3375 (undefined!4187 Bool) (index!15681 (_ BitVec 32)) (x!34544 (_ BitVec 32))) (Undefined!3375) (MissingVacant!3375 (index!15682 (_ BitVec 32))) )
))
(declare-fun lt!163215 () SeekEntryResult!3375)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346608 (= res!191794 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15680 lt!163215)))))

(declare-fun b!346610 () Bool)

(declare-fun res!191799 () Bool)

(assert (=> b!346610 (=> (not res!191799) (not e!212402))))

(declare-datatypes ((V!10931 0))(
  ( (V!10932 (val!3777 Int)) )
))
(declare-datatypes ((ValueCell!3389 0))(
  ( (ValueCellFull!3389 (v!5953 V!10931)) (EmptyCell!3389) )
))
(declare-datatypes ((array!18509 0))(
  ( (array!18510 (arr!8765 (Array (_ BitVec 32) ValueCell!3389)) (size!9118 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18509)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346610 (= res!191799 (and (= (size!9118 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9117 _keys!1895) (size!9118 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346611 () Bool)

(declare-fun res!191800 () Bool)

(assert (=> b!346611 (=> (not res!191800) (not e!212402))))

(declare-fun zeroValue!1467 () V!10931)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10931)

(declare-datatypes ((tuple2!5422 0))(
  ( (tuple2!5423 (_1!2722 (_ BitVec 64)) (_2!2722 V!10931)) )
))
(declare-datatypes ((List!5041 0))(
  ( (Nil!5038) (Cons!5037 (h!5893 tuple2!5422) (t!10160 List!5041)) )
))
(declare-datatypes ((ListLongMap!4325 0))(
  ( (ListLongMap!4326 (toList!2178 List!5041)) )
))
(declare-fun contains!2253 (ListLongMap!4325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1684 (array!18507 array!18509 (_ BitVec 32) (_ BitVec 32) V!10931 V!10931 (_ BitVec 32) Int) ListLongMap!4325)

(assert (=> b!346611 (= res!191800 (not (contains!2253 (getCurrentListMap!1684 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346612 () Bool)

(declare-fun res!191801 () Bool)

(assert (=> b!346612 (=> (not res!191801) (not e!212402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346612 (= res!191801 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12654 () Bool)

(declare-fun mapRes!12654 () Bool)

(assert (=> mapIsEmpty!12654 mapRes!12654))

(declare-fun b!346613 () Bool)

(assert (=> b!346613 (= e!212402 e!212400)))

(declare-fun res!191798 () Bool)

(assert (=> b!346613 (=> (not res!191798) (not e!212400))))

(get-info :version)

(assert (=> b!346613 (= res!191798 (and ((_ is Found!3375) lt!163215) (= (select (arr!8764 _keys!1895) (index!15680 lt!163215)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18507 (_ BitVec 32)) SeekEntryResult!3375)

(assert (=> b!346613 (= lt!163215 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12654 () Bool)

(declare-fun tp!26102 () Bool)

(declare-fun e!212404 () Bool)

(assert (=> mapNonEmpty!12654 (= mapRes!12654 (and tp!26102 e!212404))))

(declare-fun mapKey!12654 () (_ BitVec 32))

(declare-fun mapRest!12654 () (Array (_ BitVec 32) ValueCell!3389))

(declare-fun mapValue!12654 () ValueCell!3389)

(assert (=> mapNonEmpty!12654 (= (arr!8765 _values!1525) (store mapRest!12654 mapKey!12654 mapValue!12654))))

(declare-fun b!346609 () Bool)

(assert (=> b!346609 (= e!212400 (not true))))

(assert (=> b!346609 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10738 0))(
  ( (Unit!10739) )
))
(declare-fun lt!163214 () Unit!10738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18507 (_ BitVec 64) (_ BitVec 32)) Unit!10738)

(assert (=> b!346609 (= lt!163214 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15680 lt!163215)))))

(declare-fun res!191795 () Bool)

(assert (=> start!34692 (=> (not res!191795) (not e!212402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34692 (= res!191795 (validMask!0 mask!2385))))

(assert (=> start!34692 e!212402))

(assert (=> start!34692 true))

(assert (=> start!34692 tp_is_empty!7465))

(assert (=> start!34692 tp!26103))

(declare-fun e!212399 () Bool)

(declare-fun array_inv!6510 (array!18509) Bool)

(assert (=> start!34692 (and (array_inv!6510 _values!1525) e!212399)))

(declare-fun array_inv!6511 (array!18507) Bool)

(assert (=> start!34692 (array_inv!6511 _keys!1895)))

(declare-fun b!346614 () Bool)

(assert (=> b!346614 (= e!212404 tp_is_empty!7465)))

(declare-fun b!346615 () Bool)

(assert (=> b!346615 (= e!212399 (and e!212403 mapRes!12654))))

(declare-fun condMapEmpty!12654 () Bool)

(declare-fun mapDefault!12654 () ValueCell!3389)

(assert (=> b!346615 (= condMapEmpty!12654 (= (arr!8765 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3389)) mapDefault!12654)))))

(assert (= (and start!34692 res!191795) b!346610))

(assert (= (and b!346610 res!191799) b!346606))

(assert (= (and b!346606 res!191797) b!346605))

(assert (= (and b!346605 res!191796) b!346612))

(assert (= (and b!346612 res!191801) b!346611))

(assert (= (and b!346611 res!191800) b!346613))

(assert (= (and b!346613 res!191798) b!346608))

(assert (= (and b!346608 res!191794) b!346609))

(assert (= (and b!346615 condMapEmpty!12654) mapIsEmpty!12654))

(assert (= (and b!346615 (not condMapEmpty!12654)) mapNonEmpty!12654))

(assert (= (and mapNonEmpty!12654 ((_ is ValueCellFull!3389) mapValue!12654)) b!346614))

(assert (= (and b!346615 ((_ is ValueCellFull!3389) mapDefault!12654)) b!346607))

(assert (= start!34692 b!346615))

(declare-fun m!347165 () Bool)

(assert (=> b!346613 m!347165))

(declare-fun m!347167 () Bool)

(assert (=> b!346613 m!347167))

(declare-fun m!347169 () Bool)

(assert (=> start!34692 m!347169))

(declare-fun m!347171 () Bool)

(assert (=> start!34692 m!347171))

(declare-fun m!347173 () Bool)

(assert (=> start!34692 m!347173))

(declare-fun m!347175 () Bool)

(assert (=> b!346612 m!347175))

(declare-fun m!347177 () Bool)

(assert (=> b!346606 m!347177))

(declare-fun m!347179 () Bool)

(assert (=> mapNonEmpty!12654 m!347179))

(declare-fun m!347181 () Bool)

(assert (=> b!346605 m!347181))

(declare-fun m!347183 () Bool)

(assert (=> b!346611 m!347183))

(assert (=> b!346611 m!347183))

(declare-fun m!347185 () Bool)

(assert (=> b!346611 m!347185))

(declare-fun m!347187 () Bool)

(assert (=> b!346609 m!347187))

(declare-fun m!347189 () Bool)

(assert (=> b!346609 m!347189))

(declare-fun m!347191 () Bool)

(assert (=> b!346608 m!347191))

(check-sat tp_is_empty!7465 b_and!14707 (not b!346612) (not b!346606) (not b!346605) (not b!346611) (not b!346613) (not b!346609) (not b!346608) (not start!34692) (not b_next!7513) (not mapNonEmpty!12654))
(check-sat b_and!14707 (not b_next!7513))
