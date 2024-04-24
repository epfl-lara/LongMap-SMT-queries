; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34326 () Bool)

(assert start!34326)

(declare-fun b_free!7315 () Bool)

(declare-fun b_next!7315 () Bool)

(assert (=> start!34326 (= b_free!7315 (not b_next!7315))))

(declare-fun tp!25485 () Bool)

(declare-fun b_and!14533 () Bool)

(assert (=> start!34326 (= tp!25485 b_and!14533)))

(declare-fun b!342858 () Bool)

(declare-fun res!189561 () Bool)

(declare-fun e!210237 () Bool)

(assert (=> b!342858 (=> (not res!189561) (not e!210237))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10667 0))(
  ( (V!10668 (val!3678 Int)) )
))
(declare-datatypes ((ValueCell!3290 0))(
  ( (ValueCellFull!3290 (v!5853 V!10667)) (EmptyCell!3290) )
))
(declare-datatypes ((array!18120 0))(
  ( (array!18121 (arr!8578 (Array (_ BitVec 32) ValueCell!3290)) (size!8930 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18120)

(declare-datatypes ((array!18122 0))(
  ( (array!18123 (arr!8579 (Array (_ BitVec 32) (_ BitVec 64))) (size!8931 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18122)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342858 (= res!189561 (and (= (size!8930 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8931 _keys!1895) (size!8930 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342859 () Bool)

(declare-datatypes ((Unit!10664 0))(
  ( (Unit!10665) )
))
(declare-fun e!210236 () Unit!10664)

(declare-fun Unit!10666 () Unit!10664)

(assert (=> b!342859 (= e!210236 Unit!10666)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10667)

(declare-fun minValue!1467 () V!10667)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!162293 () Unit!10664)

(declare-fun lemmaArrayContainsKeyThenInListMap!318 (array!18122 array!18120 (_ BitVec 32) (_ BitVec 32) V!10667 V!10667 (_ BitVec 64) (_ BitVec 32) Int) Unit!10664)

(declare-fun arrayScanForKey!0 (array!18122 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342859 (= lt!162293 (lemmaArrayContainsKeyThenInListMap!318 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342859 false))

(declare-fun b!342860 () Bool)

(declare-fun res!189560 () Bool)

(assert (=> b!342860 (=> (not res!189560) (not e!210237))))

(declare-datatypes ((List!4848 0))(
  ( (Nil!4845) (Cons!4844 (h!5700 (_ BitVec 64)) (t!9952 List!4848)) )
))
(declare-fun arrayNoDuplicates!0 (array!18122 (_ BitVec 32) List!4848) Bool)

(assert (=> b!342860 (= res!189560 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4845))))

(declare-fun b!342861 () Bool)

(declare-fun e!210233 () Bool)

(assert (=> b!342861 (= e!210237 e!210233)))

(declare-fun res!189565 () Bool)

(assert (=> b!342861 (=> (not res!189565) (not e!210233))))

(declare-datatypes ((SeekEntryResult!3260 0))(
  ( (MissingZero!3260 (index!15219 (_ BitVec 32))) (Found!3260 (index!15220 (_ BitVec 32))) (Intermediate!3260 (undefined!4072 Bool) (index!15221 (_ BitVec 32)) (x!34087 (_ BitVec 32))) (Undefined!3260) (MissingVacant!3260 (index!15222 (_ BitVec 32))) )
))
(declare-fun lt!162294 () SeekEntryResult!3260)

(get-info :version)

(assert (=> b!342861 (= res!189565 (and (not ((_ is Found!3260) lt!162294)) (not ((_ is MissingZero!3260) lt!162294)) ((_ is MissingVacant!3260) lt!162294)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18122 (_ BitVec 32)) SeekEntryResult!3260)

(assert (=> b!342861 (= lt!162294 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12333 () Bool)

(declare-fun mapRes!12333 () Bool)

(declare-fun tp!25484 () Bool)

(declare-fun e!210238 () Bool)

(assert (=> mapNonEmpty!12333 (= mapRes!12333 (and tp!25484 e!210238))))

(declare-fun mapKey!12333 () (_ BitVec 32))

(declare-fun mapRest!12333 () (Array (_ BitVec 32) ValueCell!3290))

(declare-fun mapValue!12333 () ValueCell!3290)

(assert (=> mapNonEmpty!12333 (= (arr!8578 _values!1525) (store mapRest!12333 mapKey!12333 mapValue!12333))))

(declare-fun b!342862 () Bool)

(assert (=> b!342862 (= e!210233 false)))

(declare-fun lt!162295 () Unit!10664)

(assert (=> b!342862 (= lt!162295 e!210236)))

(declare-fun c!52829 () Bool)

(declare-fun arrayContainsKey!0 (array!18122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342862 (= c!52829 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342863 () Bool)

(declare-fun Unit!10667 () Unit!10664)

(assert (=> b!342863 (= e!210236 Unit!10667)))

(declare-fun b!342864 () Bool)

(declare-fun res!189566 () Bool)

(assert (=> b!342864 (=> (not res!189566) (not e!210237))))

(declare-datatypes ((tuple2!5246 0))(
  ( (tuple2!5247 (_1!2634 (_ BitVec 64)) (_2!2634 V!10667)) )
))
(declare-datatypes ((List!4849 0))(
  ( (Nil!4846) (Cons!4845 (h!5701 tuple2!5246) (t!9953 List!4849)) )
))
(declare-datatypes ((ListLongMap!4161 0))(
  ( (ListLongMap!4162 (toList!2096 List!4849)) )
))
(declare-fun contains!2171 (ListLongMap!4161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1625 (array!18122 array!18120 (_ BitVec 32) (_ BitVec 32) V!10667 V!10667 (_ BitVec 32) Int) ListLongMap!4161)

(assert (=> b!342864 (= res!189566 (not (contains!2171 (getCurrentListMap!1625 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12333 () Bool)

(assert (=> mapIsEmpty!12333 mapRes!12333))

(declare-fun b!342865 () Bool)

(declare-fun e!210234 () Bool)

(declare-fun tp_is_empty!7267 () Bool)

(assert (=> b!342865 (= e!210234 tp_is_empty!7267)))

(declare-fun b!342866 () Bool)

(declare-fun e!210235 () Bool)

(assert (=> b!342866 (= e!210235 (and e!210234 mapRes!12333))))

(declare-fun condMapEmpty!12333 () Bool)

(declare-fun mapDefault!12333 () ValueCell!3290)

(assert (=> b!342866 (= condMapEmpty!12333 (= (arr!8578 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3290)) mapDefault!12333)))))

(declare-fun res!189563 () Bool)

(assert (=> start!34326 (=> (not res!189563) (not e!210237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34326 (= res!189563 (validMask!0 mask!2385))))

(assert (=> start!34326 e!210237))

(assert (=> start!34326 true))

(assert (=> start!34326 tp_is_empty!7267))

(assert (=> start!34326 tp!25485))

(declare-fun array_inv!6342 (array!18120) Bool)

(assert (=> start!34326 (and (array_inv!6342 _values!1525) e!210235)))

(declare-fun array_inv!6343 (array!18122) Bool)

(assert (=> start!34326 (array_inv!6343 _keys!1895)))

(declare-fun b!342867 () Bool)

(assert (=> b!342867 (= e!210238 tp_is_empty!7267)))

(declare-fun b!342868 () Bool)

(declare-fun res!189564 () Bool)

(assert (=> b!342868 (=> (not res!189564) (not e!210237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18122 (_ BitVec 32)) Bool)

(assert (=> b!342868 (= res!189564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342869 () Bool)

(declare-fun res!189562 () Bool)

(assert (=> b!342869 (=> (not res!189562) (not e!210237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342869 (= res!189562 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34326 res!189563) b!342858))

(assert (= (and b!342858 res!189561) b!342868))

(assert (= (and b!342868 res!189564) b!342860))

(assert (= (and b!342860 res!189560) b!342869))

(assert (= (and b!342869 res!189562) b!342864))

(assert (= (and b!342864 res!189566) b!342861))

(assert (= (and b!342861 res!189565) b!342862))

(assert (= (and b!342862 c!52829) b!342859))

(assert (= (and b!342862 (not c!52829)) b!342863))

(assert (= (and b!342866 condMapEmpty!12333) mapIsEmpty!12333))

(assert (= (and b!342866 (not condMapEmpty!12333)) mapNonEmpty!12333))

(assert (= (and mapNonEmpty!12333 ((_ is ValueCellFull!3290) mapValue!12333)) b!342867))

(assert (= (and b!342866 ((_ is ValueCellFull!3290) mapDefault!12333)) b!342865))

(assert (= start!34326 b!342866))

(declare-fun m!345159 () Bool)

(assert (=> b!342862 m!345159))

(declare-fun m!345161 () Bool)

(assert (=> b!342861 m!345161))

(declare-fun m!345163 () Bool)

(assert (=> start!34326 m!345163))

(declare-fun m!345165 () Bool)

(assert (=> start!34326 m!345165))

(declare-fun m!345167 () Bool)

(assert (=> start!34326 m!345167))

(declare-fun m!345169 () Bool)

(assert (=> mapNonEmpty!12333 m!345169))

(declare-fun m!345171 () Bool)

(assert (=> b!342859 m!345171))

(assert (=> b!342859 m!345171))

(declare-fun m!345173 () Bool)

(assert (=> b!342859 m!345173))

(declare-fun m!345175 () Bool)

(assert (=> b!342869 m!345175))

(declare-fun m!345177 () Bool)

(assert (=> b!342868 m!345177))

(declare-fun m!345179 () Bool)

(assert (=> b!342860 m!345179))

(declare-fun m!345181 () Bool)

(assert (=> b!342864 m!345181))

(assert (=> b!342864 m!345181))

(declare-fun m!345183 () Bool)

(assert (=> b!342864 m!345183))

(check-sat (not b_next!7315) (not b!342869) (not start!34326) tp_is_empty!7267 (not b!342864) (not b!342868) (not b!342860) (not b!342862) (not b!342859) b_and!14533 (not mapNonEmpty!12333) (not b!342861))
(check-sat b_and!14533 (not b_next!7315))
