; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33430 () Bool)

(assert start!33430)

(declare-fun b!331930 () Bool)

(declare-fun e!203730 () Bool)

(declare-fun tp_is_empty!6697 () Bool)

(assert (=> b!331930 (= e!203730 tp_is_empty!6697)))

(declare-fun b!331931 () Bool)

(declare-fun e!203731 () Bool)

(assert (=> b!331931 (= e!203731 tp_is_empty!6697)))

(declare-fun b!331932 () Bool)

(declare-fun res!182902 () Bool)

(declare-fun e!203728 () Bool)

(assert (=> b!331932 (=> (not res!182902) (not e!203728))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9907 0))(
  ( (V!9908 (val!3393 Int)) )
))
(declare-datatypes ((ValueCell!3005 0))(
  ( (ValueCellFull!3005 (v!5553 V!9907)) (EmptyCell!3005) )
))
(declare-datatypes ((array!16994 0))(
  ( (array!16995 (arr!8031 (Array (_ BitVec 32) ValueCell!3005)) (size!8383 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16994)

(declare-datatypes ((array!16996 0))(
  ( (array!16997 (arr!8032 (Array (_ BitVec 32) (_ BitVec 64))) (size!8384 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16996)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331932 (= res!182902 (and (= (size!8383 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8384 _keys!1895) (size!8383 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182901 () Bool)

(assert (=> start!33430 (=> (not res!182901) (not e!203728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33430 (= res!182901 (validMask!0 mask!2385))))

(assert (=> start!33430 e!203728))

(assert (=> start!33430 true))

(declare-fun e!203732 () Bool)

(declare-fun array_inv!5974 (array!16994) Bool)

(assert (=> start!33430 (and (array_inv!5974 _values!1525) e!203732)))

(declare-fun array_inv!5975 (array!16996) Bool)

(assert (=> start!33430 (array_inv!5975 _keys!1895)))

(declare-fun b!331933 () Bool)

(declare-fun mapRes!11430 () Bool)

(assert (=> b!331933 (= e!203732 (and e!203731 mapRes!11430))))

(declare-fun condMapEmpty!11430 () Bool)

(declare-fun mapDefault!11430 () ValueCell!3005)

(assert (=> b!331933 (= condMapEmpty!11430 (= (arr!8031 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3005)) mapDefault!11430)))))

(declare-fun b!331934 () Bool)

(assert (=> b!331934 (= e!203728 false)))

(declare-fun lt!158959 () Bool)

(declare-datatypes ((List!4492 0))(
  ( (Nil!4489) (Cons!4488 (h!5344 (_ BitVec 64)) (t!9566 List!4492)) )
))
(declare-fun arrayNoDuplicates!0 (array!16996 (_ BitVec 32) List!4492) Bool)

(assert (=> b!331934 (= lt!158959 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4489))))

(declare-fun mapIsEmpty!11430 () Bool)

(assert (=> mapIsEmpty!11430 mapRes!11430))

(declare-fun mapNonEmpty!11430 () Bool)

(declare-fun tp!23805 () Bool)

(assert (=> mapNonEmpty!11430 (= mapRes!11430 (and tp!23805 e!203730))))

(declare-fun mapValue!11430 () ValueCell!3005)

(declare-fun mapRest!11430 () (Array (_ BitVec 32) ValueCell!3005))

(declare-fun mapKey!11430 () (_ BitVec 32))

(assert (=> mapNonEmpty!11430 (= (arr!8031 _values!1525) (store mapRest!11430 mapKey!11430 mapValue!11430))))

(declare-fun b!331935 () Bool)

(declare-fun res!182903 () Bool)

(assert (=> b!331935 (=> (not res!182903) (not e!203728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16996 (_ BitVec 32)) Bool)

(assert (=> b!331935 (= res!182903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33430 res!182901) b!331932))

(assert (= (and b!331932 res!182902) b!331935))

(assert (= (and b!331935 res!182903) b!331934))

(assert (= (and b!331933 condMapEmpty!11430) mapIsEmpty!11430))

(assert (= (and b!331933 (not condMapEmpty!11430)) mapNonEmpty!11430))

(get-info :version)

(assert (= (and mapNonEmpty!11430 ((_ is ValueCellFull!3005) mapValue!11430)) b!331930))

(assert (= (and b!331933 ((_ is ValueCellFull!3005) mapDefault!11430)) b!331931))

(assert (= start!33430 b!331933))

(declare-fun m!336881 () Bool)

(assert (=> start!33430 m!336881))

(declare-fun m!336883 () Bool)

(assert (=> start!33430 m!336883))

(declare-fun m!336885 () Bool)

(assert (=> start!33430 m!336885))

(declare-fun m!336887 () Bool)

(assert (=> b!331934 m!336887))

(declare-fun m!336889 () Bool)

(assert (=> mapNonEmpty!11430 m!336889))

(declare-fun m!336891 () Bool)

(assert (=> b!331935 m!336891))

(check-sat (not start!33430) (not mapNonEmpty!11430) (not b!331935) tp_is_empty!6697 (not b!331934))
(check-sat)
