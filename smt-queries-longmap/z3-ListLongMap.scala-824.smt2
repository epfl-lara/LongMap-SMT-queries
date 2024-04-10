; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20042 () Bool)

(assert start!20042)

(declare-fun b!196269 () Bool)

(declare-fun res!92631 () Bool)

(declare-fun e!129236 () Bool)

(assert (=> b!196269 (=> (not res!92631) (not e!129236))))

(declare-datatypes ((array!8373 0))(
  ( (array!8374 (arr!3937 (Array (_ BitVec 32) (_ BitVec 64))) (size!4262 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8373)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8373 (_ BitVec 32)) Bool)

(assert (=> b!196269 (= res!92631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196271 () Bool)

(declare-fun e!129235 () Bool)

(declare-fun tp_is_empty!4557 () Bool)

(assert (=> b!196271 (= e!129235 tp_is_empty!4557)))

(declare-fun mapIsEmpty!7904 () Bool)

(declare-fun mapRes!7904 () Bool)

(assert (=> mapIsEmpty!7904 mapRes!7904))

(declare-fun b!196272 () Bool)

(declare-fun e!129237 () Bool)

(assert (=> b!196272 (= e!129237 (and e!129235 mapRes!7904))))

(declare-fun condMapEmpty!7904 () Bool)

(declare-datatypes ((V!5723 0))(
  ( (V!5724 (val!2323 Int)) )
))
(declare-datatypes ((ValueCell!1935 0))(
  ( (ValueCellFull!1935 (v!4293 V!5723)) (EmptyCell!1935) )
))
(declare-datatypes ((array!8375 0))(
  ( (array!8376 (arr!3938 (Array (_ BitVec 32) ValueCell!1935)) (size!4263 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8375)

(declare-fun mapDefault!7904 () ValueCell!1935)

(assert (=> b!196272 (= condMapEmpty!7904 (= (arr!3938 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1935)) mapDefault!7904)))))

(declare-fun mapNonEmpty!7904 () Bool)

(declare-fun tp!17192 () Bool)

(declare-fun e!129238 () Bool)

(assert (=> mapNonEmpty!7904 (= mapRes!7904 (and tp!17192 e!129238))))

(declare-fun mapValue!7904 () ValueCell!1935)

(declare-fun mapRest!7904 () (Array (_ BitVec 32) ValueCell!1935))

(declare-fun mapKey!7904 () (_ BitVec 32))

(assert (=> mapNonEmpty!7904 (= (arr!3938 _values!649) (store mapRest!7904 mapKey!7904 mapValue!7904))))

(declare-fun b!196273 () Bool)

(declare-fun res!92632 () Bool)

(assert (=> b!196273 (=> (not res!92632) (not e!129236))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196273 (= res!92632 (and (= (size!4263 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4262 _keys!825) (size!4263 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196274 () Bool)

(assert (=> b!196274 (= e!129238 tp_is_empty!4557)))

(declare-fun res!92630 () Bool)

(assert (=> start!20042 (=> (not res!92630) (not e!129236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20042 (= res!92630 (validMask!0 mask!1149))))

(assert (=> start!20042 e!129236))

(assert (=> start!20042 true))

(declare-fun array_inv!2557 (array!8375) Bool)

(assert (=> start!20042 (and (array_inv!2557 _values!649) e!129237)))

(declare-fun array_inv!2558 (array!8373) Bool)

(assert (=> start!20042 (array_inv!2558 _keys!825)))

(declare-fun b!196270 () Bool)

(assert (=> b!196270 (= e!129236 false)))

(declare-fun lt!97590 () Bool)

(declare-datatypes ((List!2465 0))(
  ( (Nil!2462) (Cons!2461 (h!3103 (_ BitVec 64)) (t!7396 List!2465)) )
))
(declare-fun arrayNoDuplicates!0 (array!8373 (_ BitVec 32) List!2465) Bool)

(assert (=> b!196270 (= lt!97590 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2462))))

(assert (= (and start!20042 res!92630) b!196273))

(assert (= (and b!196273 res!92632) b!196269))

(assert (= (and b!196269 res!92631) b!196270))

(assert (= (and b!196272 condMapEmpty!7904) mapIsEmpty!7904))

(assert (= (and b!196272 (not condMapEmpty!7904)) mapNonEmpty!7904))

(get-info :version)

(assert (= (and mapNonEmpty!7904 ((_ is ValueCellFull!1935) mapValue!7904)) b!196274))

(assert (= (and b!196272 ((_ is ValueCellFull!1935) mapDefault!7904)) b!196271))

(assert (= start!20042 b!196272))

(declare-fun m!223603 () Bool)

(assert (=> b!196269 m!223603))

(declare-fun m!223605 () Bool)

(assert (=> mapNonEmpty!7904 m!223605))

(declare-fun m!223607 () Bool)

(assert (=> start!20042 m!223607))

(declare-fun m!223609 () Bool)

(assert (=> start!20042 m!223609))

(declare-fun m!223611 () Bool)

(assert (=> start!20042 m!223611))

(declare-fun m!223613 () Bool)

(assert (=> b!196270 m!223613))

(check-sat (not b!196269) (not start!20042) tp_is_empty!4557 (not b!196270) (not mapNonEmpty!7904))
(check-sat)
