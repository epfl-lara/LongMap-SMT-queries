; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34188 () Bool)

(assert start!34188)

(declare-fun b_free!7225 () Bool)

(declare-fun b_next!7225 () Bool)

(assert (=> start!34188 (= b_free!7225 (not b_next!7225))))

(declare-fun tp!25208 () Bool)

(declare-fun b_and!14439 () Bool)

(assert (=> start!34188 (= tp!25208 b_and!14439)))

(declare-fun b!341003 () Bool)

(declare-fun res!188477 () Bool)

(declare-fun e!209151 () Bool)

(assert (=> b!341003 (=> (not res!188477) (not e!209151))))

(declare-datatypes ((array!17940 0))(
  ( (array!17941 (arr!8490 (Array (_ BitVec 32) (_ BitVec 64))) (size!8842 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17940)

(declare-datatypes ((List!4786 0))(
  ( (Nil!4783) (Cons!4782 (h!5638 (_ BitVec 64)) (t!9886 List!4786)) )
))
(declare-fun arrayNoDuplicates!0 (array!17940 (_ BitVec 32) List!4786) Bool)

(assert (=> b!341003 (= res!188477 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4783))))

(declare-fun b!341004 () Bool)

(declare-fun res!188474 () Bool)

(assert (=> b!341004 (=> (not res!188474) (not e!209151))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341004 (= res!188474 (validKeyInArray!0 k0!1348))))

(declare-fun b!341005 () Bool)

(declare-fun e!209154 () Bool)

(declare-fun tp_is_empty!7177 () Bool)

(assert (=> b!341005 (= e!209154 tp_is_empty!7177)))

(declare-fun b!341006 () Bool)

(declare-fun res!188472 () Bool)

(declare-fun e!209155 () Bool)

(assert (=> b!341006 (=> (not res!188472) (not e!209155))))

(declare-fun arrayContainsKey!0 (array!17940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341006 (= res!188472 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341007 () Bool)

(declare-fun res!188470 () Bool)

(assert (=> b!341007 (=> (not res!188470) (not e!209151))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10547 0))(
  ( (V!10548 (val!3633 Int)) )
))
(declare-datatypes ((ValueCell!3245 0))(
  ( (ValueCellFull!3245 (v!5806 V!10547)) (EmptyCell!3245) )
))
(declare-datatypes ((array!17942 0))(
  ( (array!17943 (arr!8491 (Array (_ BitVec 32) ValueCell!3245)) (size!8843 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17942)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341007 (= res!188470 (and (= (size!8843 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8842 _keys!1895) (size!8843 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341008 () Bool)

(declare-fun e!209153 () Bool)

(declare-fun mapRes!12192 () Bool)

(assert (=> b!341008 (= e!209153 (and e!209154 mapRes!12192))))

(declare-fun condMapEmpty!12192 () Bool)

(declare-fun mapDefault!12192 () ValueCell!3245)

(assert (=> b!341008 (= condMapEmpty!12192 (= (arr!8491 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3245)) mapDefault!12192)))))

(declare-fun mapIsEmpty!12192 () Bool)

(assert (=> mapIsEmpty!12192 mapRes!12192))

(declare-fun b!341009 () Bool)

(assert (=> b!341009 (= e!209155 false)))

(declare-fun lt!161719 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17940 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341009 (= lt!161719 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12192 () Bool)

(declare-fun tp!25209 () Bool)

(declare-fun e!209152 () Bool)

(assert (=> mapNonEmpty!12192 (= mapRes!12192 (and tp!25209 e!209152))))

(declare-fun mapRest!12192 () (Array (_ BitVec 32) ValueCell!3245))

(declare-fun mapKey!12192 () (_ BitVec 32))

(declare-fun mapValue!12192 () ValueCell!3245)

(assert (=> mapNonEmpty!12192 (= (arr!8491 _values!1525) (store mapRest!12192 mapKey!12192 mapValue!12192))))

(declare-fun b!341010 () Bool)

(assert (=> b!341010 (= e!209151 e!209155)))

(declare-fun res!188471 () Bool)

(assert (=> b!341010 (=> (not res!188471) (not e!209155))))

(declare-datatypes ((SeekEntryResult!3233 0))(
  ( (MissingZero!3233 (index!15111 (_ BitVec 32))) (Found!3233 (index!15112 (_ BitVec 32))) (Intermediate!3233 (undefined!4045 Bool) (index!15113 (_ BitVec 32)) (x!33920 (_ BitVec 32))) (Undefined!3233) (MissingVacant!3233 (index!15114 (_ BitVec 32))) )
))
(declare-fun lt!161718 () SeekEntryResult!3233)

(get-info :version)

(assert (=> b!341010 (= res!188471 (and (not ((_ is Found!3233) lt!161718)) (not ((_ is MissingZero!3233) lt!161718)) ((_ is MissingVacant!3233) lt!161718)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17940 (_ BitVec 32)) SeekEntryResult!3233)

(assert (=> b!341010 (= lt!161718 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!188475 () Bool)

(assert (=> start!34188 (=> (not res!188475) (not e!209151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34188 (= res!188475 (validMask!0 mask!2385))))

(assert (=> start!34188 e!209151))

(assert (=> start!34188 true))

(assert (=> start!34188 tp_is_empty!7177))

(assert (=> start!34188 tp!25208))

(declare-fun array_inv!6290 (array!17942) Bool)

(assert (=> start!34188 (and (array_inv!6290 _values!1525) e!209153)))

(declare-fun array_inv!6291 (array!17940) Bool)

(assert (=> start!34188 (array_inv!6291 _keys!1895)))

(declare-fun b!341011 () Bool)

(declare-fun res!188473 () Bool)

(assert (=> b!341011 (=> (not res!188473) (not e!209151))))

(declare-fun zeroValue!1467 () V!10547)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10547)

(declare-datatypes ((tuple2!5182 0))(
  ( (tuple2!5183 (_1!2602 (_ BitVec 64)) (_2!2602 V!10547)) )
))
(declare-datatypes ((List!4787 0))(
  ( (Nil!4784) (Cons!4783 (h!5639 tuple2!5182) (t!9887 List!4787)) )
))
(declare-datatypes ((ListLongMap!4097 0))(
  ( (ListLongMap!4098 (toList!2064 List!4787)) )
))
(declare-fun contains!2137 (ListLongMap!4097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1593 (array!17940 array!17942 (_ BitVec 32) (_ BitVec 32) V!10547 V!10547 (_ BitVec 32) Int) ListLongMap!4097)

(assert (=> b!341011 (= res!188473 (not (contains!2137 (getCurrentListMap!1593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341012 () Bool)

(declare-fun res!188476 () Bool)

(assert (=> b!341012 (=> (not res!188476) (not e!209151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17940 (_ BitVec 32)) Bool)

(assert (=> b!341012 (= res!188476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341013 () Bool)

(assert (=> b!341013 (= e!209152 tp_is_empty!7177)))

(assert (= (and start!34188 res!188475) b!341007))

(assert (= (and b!341007 res!188470) b!341012))

(assert (= (and b!341012 res!188476) b!341003))

(assert (= (and b!341003 res!188477) b!341004))

(assert (= (and b!341004 res!188474) b!341011))

(assert (= (and b!341011 res!188473) b!341010))

(assert (= (and b!341010 res!188471) b!341006))

(assert (= (and b!341006 res!188472) b!341009))

(assert (= (and b!341008 condMapEmpty!12192) mapIsEmpty!12192))

(assert (= (and b!341008 (not condMapEmpty!12192)) mapNonEmpty!12192))

(assert (= (and mapNonEmpty!12192 ((_ is ValueCellFull!3245) mapValue!12192)) b!341013))

(assert (= (and b!341008 ((_ is ValueCellFull!3245) mapDefault!12192)) b!341005))

(assert (= start!34188 b!341008))

(declare-fun m!343815 () Bool)

(assert (=> mapNonEmpty!12192 m!343815))

(declare-fun m!343817 () Bool)

(assert (=> b!341006 m!343817))

(declare-fun m!343819 () Bool)

(assert (=> b!341012 m!343819))

(declare-fun m!343821 () Bool)

(assert (=> b!341011 m!343821))

(assert (=> b!341011 m!343821))

(declare-fun m!343823 () Bool)

(assert (=> b!341011 m!343823))

(declare-fun m!343825 () Bool)

(assert (=> b!341010 m!343825))

(declare-fun m!343827 () Bool)

(assert (=> b!341004 m!343827))

(declare-fun m!343829 () Bool)

(assert (=> b!341009 m!343829))

(declare-fun m!343831 () Bool)

(assert (=> start!34188 m!343831))

(declare-fun m!343833 () Bool)

(assert (=> start!34188 m!343833))

(declare-fun m!343835 () Bool)

(assert (=> start!34188 m!343835))

(declare-fun m!343837 () Bool)

(assert (=> b!341003 m!343837))

(check-sat (not start!34188) (not b_next!7225) (not b!341011) b_and!14439 (not b!341012) (not b!341004) (not b!341010) (not mapNonEmpty!12192) tp_is_empty!7177 (not b!341003) (not b!341009) (not b!341006))
(check-sat b_and!14439 (not b_next!7225))
