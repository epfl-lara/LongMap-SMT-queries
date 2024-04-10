; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35788 () Bool)

(assert start!35788)

(declare-fun b!359481 () Bool)

(declare-fun res!199799 () Bool)

(declare-fun e!220186 () Bool)

(assert (=> b!359481 (=> (not res!199799) (not e!220186))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20037 0))(
  ( (array!20038 (arr!9512 (Array (_ BitVec 32) (_ BitVec 64))) (size!9864 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20037)

(declare-datatypes ((V!11965 0))(
  ( (V!11966 (val!4165 Int)) )
))
(declare-datatypes ((ValueCell!3777 0))(
  ( (ValueCellFull!3777 (v!6359 V!11965)) (EmptyCell!3777) )
))
(declare-datatypes ((array!20039 0))(
  ( (array!20040 (arr!9513 (Array (_ BitVec 32) ValueCell!3777)) (size!9865 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20039)

(assert (=> b!359481 (= res!199799 (and (= (size!9865 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9864 _keys!1456) (size!9865 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13869 () Bool)

(declare-fun mapRes!13869 () Bool)

(assert (=> mapIsEmpty!13869 mapRes!13869))

(declare-fun b!359482 () Bool)

(declare-fun e!220187 () Bool)

(declare-fun tp_is_empty!8241 () Bool)

(assert (=> b!359482 (= e!220187 tp_is_empty!8241)))

(declare-fun b!359483 () Bool)

(assert (=> b!359483 (= e!220186 false)))

(declare-fun lt!166349 () Bool)

(declare-datatypes ((List!5469 0))(
  ( (Nil!5466) (Cons!5465 (h!6321 (_ BitVec 64)) (t!10619 List!5469)) )
))
(declare-fun arrayNoDuplicates!0 (array!20037 (_ BitVec 32) List!5469) Bool)

(assert (=> b!359483 (= lt!166349 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5466))))

(declare-fun mapNonEmpty!13869 () Bool)

(declare-fun tp!27936 () Bool)

(assert (=> mapNonEmpty!13869 (= mapRes!13869 (and tp!27936 e!220187))))

(declare-fun mapKey!13869 () (_ BitVec 32))

(declare-fun mapValue!13869 () ValueCell!3777)

(declare-fun mapRest!13869 () (Array (_ BitVec 32) ValueCell!3777))

(assert (=> mapNonEmpty!13869 (= (arr!9513 _values!1208) (store mapRest!13869 mapKey!13869 mapValue!13869))))

(declare-fun b!359484 () Bool)

(declare-fun res!199801 () Bool)

(assert (=> b!359484 (=> (not res!199801) (not e!220186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20037 (_ BitVec 32)) Bool)

(assert (=> b!359484 (= res!199801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359485 () Bool)

(declare-fun e!220184 () Bool)

(declare-fun e!220183 () Bool)

(assert (=> b!359485 (= e!220184 (and e!220183 mapRes!13869))))

(declare-fun condMapEmpty!13869 () Bool)

(declare-fun mapDefault!13869 () ValueCell!3777)

(assert (=> b!359485 (= condMapEmpty!13869 (= (arr!9513 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3777)) mapDefault!13869)))))

(declare-fun b!359480 () Bool)

(assert (=> b!359480 (= e!220183 tp_is_empty!8241)))

(declare-fun res!199800 () Bool)

(assert (=> start!35788 (=> (not res!199800) (not e!220186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35788 (= res!199800 (validMask!0 mask!1842))))

(assert (=> start!35788 e!220186))

(assert (=> start!35788 true))

(declare-fun array_inv!6996 (array!20039) Bool)

(assert (=> start!35788 (and (array_inv!6996 _values!1208) e!220184)))

(declare-fun array_inv!6997 (array!20037) Bool)

(assert (=> start!35788 (array_inv!6997 _keys!1456)))

(assert (= (and start!35788 res!199800) b!359481))

(assert (= (and b!359481 res!199799) b!359484))

(assert (= (and b!359484 res!199801) b!359483))

(assert (= (and b!359485 condMapEmpty!13869) mapIsEmpty!13869))

(assert (= (and b!359485 (not condMapEmpty!13869)) mapNonEmpty!13869))

(get-info :version)

(assert (= (and mapNonEmpty!13869 ((_ is ValueCellFull!3777) mapValue!13869)) b!359482))

(assert (= (and b!359485 ((_ is ValueCellFull!3777) mapDefault!13869)) b!359480))

(assert (= start!35788 b!359485))

(declare-fun m!356971 () Bool)

(assert (=> b!359483 m!356971))

(declare-fun m!356973 () Bool)

(assert (=> mapNonEmpty!13869 m!356973))

(declare-fun m!356975 () Bool)

(assert (=> b!359484 m!356975))

(declare-fun m!356977 () Bool)

(assert (=> start!35788 m!356977))

(declare-fun m!356979 () Bool)

(assert (=> start!35788 m!356979))

(declare-fun m!356981 () Bool)

(assert (=> start!35788 m!356981))

(check-sat (not mapNonEmpty!13869) tp_is_empty!8241 (not b!359483) (not b!359484) (not start!35788))
(check-sat)
