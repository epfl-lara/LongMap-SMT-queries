; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34426 () Bool)

(assert start!34426)

(declare-fun b_free!7363 () Bool)

(declare-fun b_next!7363 () Bool)

(assert (=> start!34426 (= b_free!7363 (not b_next!7363))))

(declare-fun tp!25634 () Bool)

(declare-fun b_and!14585 () Bool)

(assert (=> start!34426 (= tp!25634 b_and!14585)))

(declare-fun b!343895 () Bool)

(declare-fun e!210844 () Bool)

(declare-fun tp_is_empty!7315 () Bool)

(assert (=> b!343895 (= e!210844 tp_is_empty!7315)))

(declare-fun mapNonEmpty!12411 () Bool)

(declare-fun mapRes!12411 () Bool)

(declare-fun tp!25635 () Bool)

(assert (=> mapNonEmpty!12411 (= mapRes!12411 (and tp!25635 e!210844))))

(declare-fun mapKey!12411 () (_ BitVec 32))

(declare-datatypes ((V!10731 0))(
  ( (V!10732 (val!3702 Int)) )
))
(declare-datatypes ((ValueCell!3314 0))(
  ( (ValueCellFull!3314 (v!5879 V!10731)) (EmptyCell!3314) )
))
(declare-fun mapValue!12411 () ValueCell!3314)

(declare-datatypes ((array!18216 0))(
  ( (array!18217 (arr!8624 (Array (_ BitVec 32) ValueCell!3314)) (size!8976 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18216)

(declare-fun mapRest!12411 () (Array (_ BitVec 32) ValueCell!3314))

(assert (=> mapNonEmpty!12411 (= (arr!8624 _values!1525) (store mapRest!12411 mapKey!12411 mapValue!12411))))

(declare-fun b!343896 () Bool)

(declare-fun e!210842 () Bool)

(assert (=> b!343896 (= e!210842 false)))

(declare-datatypes ((SeekEntryResult!3279 0))(
  ( (MissingZero!3279 (index!15295 (_ BitVec 32))) (Found!3279 (index!15296 (_ BitVec 32))) (Intermediate!3279 (undefined!4091 Bool) (index!15297 (_ BitVec 32)) (x!34190 (_ BitVec 32))) (Undefined!3279) (MissingVacant!3279 (index!15298 (_ BitVec 32))) )
))
(declare-fun lt!162637 () SeekEntryResult!3279)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18218 0))(
  ( (array!18219 (arr!8625 (Array (_ BitVec 32) (_ BitVec 64))) (size!8977 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18218)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18218 (_ BitVec 32)) SeekEntryResult!3279)

(assert (=> b!343896 (= lt!162637 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!190155 () Bool)

(assert (=> start!34426 (=> (not res!190155) (not e!210842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34426 (= res!190155 (validMask!0 mask!2385))))

(assert (=> start!34426 e!210842))

(assert (=> start!34426 true))

(assert (=> start!34426 tp_is_empty!7315))

(assert (=> start!34426 tp!25634))

(declare-fun e!210845 () Bool)

(declare-fun array_inv!6372 (array!18216) Bool)

(assert (=> start!34426 (and (array_inv!6372 _values!1525) e!210845)))

(declare-fun array_inv!6373 (array!18218) Bool)

(assert (=> start!34426 (array_inv!6373 _keys!1895)))

(declare-fun b!343897 () Bool)

(declare-fun res!190160 () Bool)

(assert (=> b!343897 (=> (not res!190160) (not e!210842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343897 (= res!190160 (validKeyInArray!0 k0!1348))))

(declare-fun b!343898 () Bool)

(declare-fun e!210843 () Bool)

(assert (=> b!343898 (= e!210843 tp_is_empty!7315)))

(declare-fun mapIsEmpty!12411 () Bool)

(assert (=> mapIsEmpty!12411 mapRes!12411))

(declare-fun b!343899 () Bool)

(declare-fun res!190159 () Bool)

(assert (=> b!343899 (=> (not res!190159) (not e!210842))))

(declare-datatypes ((List!4885 0))(
  ( (Nil!4882) (Cons!4881 (h!5737 (_ BitVec 64)) (t!9993 List!4885)) )
))
(declare-fun arrayNoDuplicates!0 (array!18218 (_ BitVec 32) List!4885) Bool)

(assert (=> b!343899 (= res!190159 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4882))))

(declare-fun b!343900 () Bool)

(assert (=> b!343900 (= e!210845 (and e!210843 mapRes!12411))))

(declare-fun condMapEmpty!12411 () Bool)

(declare-fun mapDefault!12411 () ValueCell!3314)

(assert (=> b!343900 (= condMapEmpty!12411 (= (arr!8624 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3314)) mapDefault!12411)))))

(declare-fun b!343901 () Bool)

(declare-fun res!190156 () Bool)

(assert (=> b!343901 (=> (not res!190156) (not e!210842))))

(declare-fun zeroValue!1467 () V!10731)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10731)

(declare-datatypes ((tuple2!5280 0))(
  ( (tuple2!5281 (_1!2651 (_ BitVec 64)) (_2!2651 V!10731)) )
))
(declare-datatypes ((List!4886 0))(
  ( (Nil!4883) (Cons!4882 (h!5738 tuple2!5280) (t!9994 List!4886)) )
))
(declare-datatypes ((ListLongMap!4195 0))(
  ( (ListLongMap!4196 (toList!2113 List!4886)) )
))
(declare-fun contains!2190 (ListLongMap!4195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1642 (array!18218 array!18216 (_ BitVec 32) (_ BitVec 32) V!10731 V!10731 (_ BitVec 32) Int) ListLongMap!4195)

(assert (=> b!343901 (= res!190156 (not (contains!2190 (getCurrentListMap!1642 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343902 () Bool)

(declare-fun res!190158 () Bool)

(assert (=> b!343902 (=> (not res!190158) (not e!210842))))

(assert (=> b!343902 (= res!190158 (and (= (size!8976 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8977 _keys!1895) (size!8976 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343903 () Bool)

(declare-fun res!190157 () Bool)

(assert (=> b!343903 (=> (not res!190157) (not e!210842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18218 (_ BitVec 32)) Bool)

(assert (=> b!343903 (= res!190157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34426 res!190155) b!343902))

(assert (= (and b!343902 res!190158) b!343903))

(assert (= (and b!343903 res!190157) b!343899))

(assert (= (and b!343899 res!190159) b!343897))

(assert (= (and b!343897 res!190160) b!343901))

(assert (= (and b!343901 res!190156) b!343896))

(assert (= (and b!343900 condMapEmpty!12411) mapIsEmpty!12411))

(assert (= (and b!343900 (not condMapEmpty!12411)) mapNonEmpty!12411))

(get-info :version)

(assert (= (and mapNonEmpty!12411 ((_ is ValueCellFull!3314) mapValue!12411)) b!343895))

(assert (= (and b!343900 ((_ is ValueCellFull!3314) mapDefault!12411)) b!343898))

(assert (= start!34426 b!343900))

(declare-fun m!345921 () Bool)

(assert (=> b!343901 m!345921))

(assert (=> b!343901 m!345921))

(declare-fun m!345923 () Bool)

(assert (=> b!343901 m!345923))

(declare-fun m!345925 () Bool)

(assert (=> b!343897 m!345925))

(declare-fun m!345927 () Bool)

(assert (=> mapNonEmpty!12411 m!345927))

(declare-fun m!345929 () Bool)

(assert (=> b!343903 m!345929))

(declare-fun m!345931 () Bool)

(assert (=> b!343896 m!345931))

(declare-fun m!345933 () Bool)

(assert (=> b!343899 m!345933))

(declare-fun m!345935 () Bool)

(assert (=> start!34426 m!345935))

(declare-fun m!345937 () Bool)

(assert (=> start!34426 m!345937))

(declare-fun m!345939 () Bool)

(assert (=> start!34426 m!345939))

(check-sat (not b!343901) (not b!343896) tp_is_empty!7315 (not b!343897) (not b_next!7363) (not mapNonEmpty!12411) (not b!343899) (not start!34426) b_and!14585 (not b!343903))
(check-sat b_and!14585 (not b_next!7363))
