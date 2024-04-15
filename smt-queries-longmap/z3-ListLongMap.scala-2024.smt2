; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35242 () Bool)

(assert start!35242)

(declare-fun b!353154 () Bool)

(declare-fun e!216237 () Bool)

(declare-fun tp_is_empty!7765 () Bool)

(assert (=> b!353154 (= e!216237 tp_is_empty!7765)))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun b!353155 () Bool)

(declare-datatypes ((array!19097 0))(
  ( (array!19098 (arr!9048 (Array (_ BitVec 32) (_ BitVec 64))) (size!9401 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19097)

(declare-fun e!216234 () Bool)

(declare-datatypes ((V!11331 0))(
  ( (V!11332 (val!3927 Int)) )
))
(declare-datatypes ((ValueCell!3539 0))(
  ( (ValueCellFull!3539 (v!6114 V!11331)) (EmptyCell!3539) )
))
(declare-datatypes ((array!19099 0))(
  ( (array!19100 (arr!9049 (Array (_ BitVec 32) ValueCell!3539)) (size!9402 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19099)

(assert (=> b!353155 (= e!216234 (and (= (size!9402 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9401 _keys!1456) (size!9402 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011) (not (= (size!9401 _keys!1456) (bvadd #b00000000000000000000000000000001 mask!1842)))))))

(declare-fun res!195845 () Bool)

(assert (=> start!35242 (=> (not res!195845) (not e!216234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35242 (= res!195845 (validMask!0 mask!1842))))

(assert (=> start!35242 e!216234))

(assert (=> start!35242 true))

(declare-fun e!216236 () Bool)

(declare-fun array_inv!6696 (array!19099) Bool)

(assert (=> start!35242 (and (array_inv!6696 _values!1208) e!216236)))

(declare-fun array_inv!6697 (array!19097) Bool)

(assert (=> start!35242 (array_inv!6697 _keys!1456)))

(declare-fun b!353156 () Bool)

(declare-fun e!216238 () Bool)

(assert (=> b!353156 (= e!216238 tp_is_empty!7765)))

(declare-fun b!353157 () Bool)

(declare-fun mapRes!13137 () Bool)

(assert (=> b!353157 (= e!216236 (and e!216238 mapRes!13137))))

(declare-fun condMapEmpty!13137 () Bool)

(declare-fun mapDefault!13137 () ValueCell!3539)

(assert (=> b!353157 (= condMapEmpty!13137 (= (arr!9049 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3539)) mapDefault!13137)))))

(declare-fun mapIsEmpty!13137 () Bool)

(assert (=> mapIsEmpty!13137 mapRes!13137))

(declare-fun mapNonEmpty!13137 () Bool)

(declare-fun tp!27033 () Bool)

(assert (=> mapNonEmpty!13137 (= mapRes!13137 (and tp!27033 e!216237))))

(declare-fun mapRest!13137 () (Array (_ BitVec 32) ValueCell!3539))

(declare-fun mapKey!13137 () (_ BitVec 32))

(declare-fun mapValue!13137 () ValueCell!3539)

(assert (=> mapNonEmpty!13137 (= (arr!9049 _values!1208) (store mapRest!13137 mapKey!13137 mapValue!13137))))

(assert (= (and start!35242 res!195845) b!353155))

(assert (= (and b!353157 condMapEmpty!13137) mapIsEmpty!13137))

(assert (= (and b!353157 (not condMapEmpty!13137)) mapNonEmpty!13137))

(get-info :version)

(assert (= (and mapNonEmpty!13137 ((_ is ValueCellFull!3539) mapValue!13137)) b!353154))

(assert (= (and b!353157 ((_ is ValueCellFull!3539) mapDefault!13137)) b!353156))

(assert (= start!35242 b!353157))

(declare-fun m!352085 () Bool)

(assert (=> start!35242 m!352085))

(declare-fun m!352087 () Bool)

(assert (=> start!35242 m!352087))

(declare-fun m!352089 () Bool)

(assert (=> start!35242 m!352089))

(declare-fun m!352091 () Bool)

(assert (=> mapNonEmpty!13137 m!352091))

(check-sat (not start!35242) (not mapNonEmpty!13137) tp_is_empty!7765)
(check-sat)
