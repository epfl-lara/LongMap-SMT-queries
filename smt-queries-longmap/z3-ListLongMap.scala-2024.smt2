; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35242 () Bool)

(assert start!35242)

(declare-fun b!353376 () Bool)

(declare-fun e!216380 () Bool)

(declare-fun tp_is_empty!7765 () Bool)

(assert (=> b!353376 (= e!216380 tp_is_empty!7765)))

(declare-fun mapIsEmpty!13137 () Bool)

(declare-fun mapRes!13137 () Bool)

(assert (=> mapIsEmpty!13137 mapRes!13137))

(declare-fun b!353377 () Bool)

(declare-fun e!216377 () Bool)

(assert (=> b!353377 (= e!216377 tp_is_empty!7765)))

(declare-fun res!195971 () Bool)

(declare-fun e!216378 () Bool)

(assert (=> start!35242 (=> (not res!195971) (not e!216378))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35242 (= res!195971 (validMask!0 mask!1842))))

(assert (=> start!35242 e!216378))

(assert (=> start!35242 true))

(declare-datatypes ((V!11331 0))(
  ( (V!11332 (val!3927 Int)) )
))
(declare-datatypes ((ValueCell!3539 0))(
  ( (ValueCellFull!3539 (v!6121 V!11331)) (EmptyCell!3539) )
))
(declare-datatypes ((array!19110 0))(
  ( (array!19111 (arr!9054 (Array (_ BitVec 32) ValueCell!3539)) (size!9406 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19110)

(declare-fun e!216379 () Bool)

(declare-fun array_inv!6686 (array!19110) Bool)

(assert (=> start!35242 (and (array_inv!6686 _values!1208) e!216379)))

(declare-datatypes ((array!19112 0))(
  ( (array!19113 (arr!9055 (Array (_ BitVec 32) (_ BitVec 64))) (size!9407 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19112)

(declare-fun array_inv!6687 (array!19112) Bool)

(assert (=> start!35242 (array_inv!6687 _keys!1456)))

(declare-fun b!353378 () Bool)

(assert (=> b!353378 (= e!216379 (and e!216377 mapRes!13137))))

(declare-fun condMapEmpty!13137 () Bool)

(declare-fun mapDefault!13137 () ValueCell!3539)

(assert (=> b!353378 (= condMapEmpty!13137 (= (arr!9054 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3539)) mapDefault!13137)))))

(declare-fun mapNonEmpty!13137 () Bool)

(declare-fun tp!27033 () Bool)

(assert (=> mapNonEmpty!13137 (= mapRes!13137 (and tp!27033 e!216380))))

(declare-fun mapValue!13137 () ValueCell!3539)

(declare-fun mapKey!13137 () (_ BitVec 32))

(declare-fun mapRest!13137 () (Array (_ BitVec 32) ValueCell!3539))

(assert (=> mapNonEmpty!13137 (= (arr!9054 _values!1208) (store mapRest!13137 mapKey!13137 mapValue!13137))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun b!353379 () Bool)

(assert (=> b!353379 (= e!216378 (and (= (size!9406 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9407 _keys!1456) (size!9406 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (not (= (size!9407 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)))))))

(assert (= (and start!35242 res!195971) b!353379))

(assert (= (and b!353378 condMapEmpty!13137) mapIsEmpty!13137))

(assert (= (and b!353378 (not condMapEmpty!13137)) mapNonEmpty!13137))

(get-info :version)

(assert (= (and mapNonEmpty!13137 ((_ is ValueCellFull!3539) mapValue!13137)) b!353376))

(assert (= (and b!353378 ((_ is ValueCellFull!3539) mapDefault!13137)) b!353377))

(assert (= start!35242 b!353378))

(declare-fun m!353039 () Bool)

(assert (=> start!35242 m!353039))

(declare-fun m!353041 () Bool)

(assert (=> start!35242 m!353041))

(declare-fun m!353043 () Bool)

(assert (=> start!35242 m!353043))

(declare-fun m!353045 () Bool)

(assert (=> mapNonEmpty!13137 m!353045))

(check-sat (not start!35242) (not mapNonEmpty!13137) tp_is_empty!7765)
(check-sat)
