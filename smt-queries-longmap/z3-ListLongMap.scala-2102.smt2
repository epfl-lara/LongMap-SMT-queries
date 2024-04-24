; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35766 () Bool)

(assert start!35766)

(declare-fun b!359355 () Bool)

(declare-fun res!199760 () Bool)

(declare-fun e!220093 () Bool)

(assert (=> b!359355 (=> (not res!199760) (not e!220093))))

(declare-datatypes ((array!20002 0))(
  ( (array!20003 (arr!9494 (Array (_ BitVec 32) (_ BitVec 64))) (size!9846 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20002)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20002 (_ BitVec 32)) Bool)

(assert (=> b!359355 (= res!199760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359356 () Bool)

(assert (=> b!359356 (= e!220093 false)))

(declare-fun lt!166355 () Bool)

(declare-datatypes ((List!5375 0))(
  ( (Nil!5372) (Cons!5371 (h!6227 (_ BitVec 64)) (t!10517 List!5375)) )
))
(declare-fun arrayNoDuplicates!0 (array!20002 (_ BitVec 32) List!5375) Bool)

(assert (=> b!359356 (= lt!166355 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5372))))

(declare-fun b!359357 () Bool)

(declare-fun e!220091 () Bool)

(declare-fun tp_is_empty!8233 () Bool)

(assert (=> b!359357 (= e!220091 tp_is_empty!8233)))

(declare-fun b!359359 () Bool)

(declare-fun e!220090 () Bool)

(declare-fun e!220092 () Bool)

(declare-fun mapRes!13857 () Bool)

(assert (=> b!359359 (= e!220090 (and e!220092 mapRes!13857))))

(declare-fun condMapEmpty!13857 () Bool)

(declare-datatypes ((V!11955 0))(
  ( (V!11956 (val!4161 Int)) )
))
(declare-datatypes ((ValueCell!3773 0))(
  ( (ValueCellFull!3773 (v!6356 V!11955)) (EmptyCell!3773) )
))
(declare-datatypes ((array!20004 0))(
  ( (array!20005 (arr!9495 (Array (_ BitVec 32) ValueCell!3773)) (size!9847 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20004)

(declare-fun mapDefault!13857 () ValueCell!3773)

(assert (=> b!359359 (= condMapEmpty!13857 (= (arr!9495 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3773)) mapDefault!13857)))))

(declare-fun mapIsEmpty!13857 () Bool)

(assert (=> mapIsEmpty!13857 mapRes!13857))

(declare-fun b!359360 () Bool)

(assert (=> b!359360 (= e!220092 tp_is_empty!8233)))

(declare-fun mapNonEmpty!13857 () Bool)

(declare-fun tp!27924 () Bool)

(assert (=> mapNonEmpty!13857 (= mapRes!13857 (and tp!27924 e!220091))))

(declare-fun mapKey!13857 () (_ BitVec 32))

(declare-fun mapValue!13857 () ValueCell!3773)

(declare-fun mapRest!13857 () (Array (_ BitVec 32) ValueCell!3773))

(assert (=> mapNonEmpty!13857 (= (arr!9495 _values!1208) (store mapRest!13857 mapKey!13857 mapValue!13857))))

(declare-fun res!199761 () Bool)

(assert (=> start!35766 (=> (not res!199761) (not e!220093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35766 (= res!199761 (validMask!0 mask!1842))))

(assert (=> start!35766 e!220093))

(assert (=> start!35766 true))

(declare-fun array_inv!7018 (array!20004) Bool)

(assert (=> start!35766 (and (array_inv!7018 _values!1208) e!220090)))

(declare-fun array_inv!7019 (array!20002) Bool)

(assert (=> start!35766 (array_inv!7019 _keys!1456)))

(declare-fun b!359358 () Bool)

(declare-fun res!199762 () Bool)

(assert (=> b!359358 (=> (not res!199762) (not e!220093))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359358 (= res!199762 (and (= (size!9847 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9846 _keys!1456) (size!9847 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35766 res!199761) b!359358))

(assert (= (and b!359358 res!199762) b!359355))

(assert (= (and b!359355 res!199760) b!359356))

(assert (= (and b!359359 condMapEmpty!13857) mapIsEmpty!13857))

(assert (= (and b!359359 (not condMapEmpty!13857)) mapNonEmpty!13857))

(get-info :version)

(assert (= (and mapNonEmpty!13857 ((_ is ValueCellFull!3773) mapValue!13857)) b!359357))

(assert (= (and b!359359 ((_ is ValueCellFull!3773) mapDefault!13857)) b!359360))

(assert (= start!35766 b!359359))

(declare-fun m!357147 () Bool)

(assert (=> b!359355 m!357147))

(declare-fun m!357149 () Bool)

(assert (=> b!359356 m!357149))

(declare-fun m!357151 () Bool)

(assert (=> mapNonEmpty!13857 m!357151))

(declare-fun m!357153 () Bool)

(assert (=> start!35766 m!357153))

(declare-fun m!357155 () Bool)

(assert (=> start!35766 m!357155))

(declare-fun m!357157 () Bool)

(assert (=> start!35766 m!357157))

(check-sat (not start!35766) (not mapNonEmpty!13857) (not b!359356) (not b!359355) tp_is_empty!8233)
(check-sat)
