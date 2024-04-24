; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70202 () Bool)

(assert start!70202)

(declare-fun b_free!12457 () Bool)

(declare-fun b_next!12457 () Bool)

(assert (=> start!70202 (= b_free!12457 (not b_next!12457))))

(declare-fun tp!44085 () Bool)

(declare-fun b_and!21239 () Bool)

(assert (=> start!70202 (= tp!44085 b_and!21239)))

(declare-fun b!814847 () Bool)

(declare-fun e!451687 () Bool)

(declare-fun tp_is_empty!14167 () Bool)

(assert (=> b!814847 (= e!451687 tp_is_empty!14167)))

(declare-fun b!814848 () Bool)

(declare-fun e!451688 () Bool)

(declare-fun mapRes!22831 () Bool)

(assert (=> b!814848 (= e!451688 (and e!451687 mapRes!22831))))

(declare-fun condMapEmpty!22831 () Bool)

(declare-datatypes ((V!23891 0))(
  ( (V!23892 (val!7131 Int)) )
))
(declare-datatypes ((ValueCell!6668 0))(
  ( (ValueCellFull!6668 (v!9558 V!23891)) (EmptyCell!6668) )
))
(declare-datatypes ((array!44541 0))(
  ( (array!44542 (arr!21326 (Array (_ BitVec 32) ValueCell!6668)) (size!21746 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44541)

(declare-fun mapDefault!22831 () ValueCell!6668)

(assert (=> b!814848 (= condMapEmpty!22831 (= (arr!21326 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6668)) mapDefault!22831)))))

(declare-fun b!814849 () Bool)

(declare-fun e!451691 () Bool)

(assert (=> b!814849 (= e!451691 false)))

(declare-datatypes ((array!44543 0))(
  ( (array!44544 (arr!21327 (Array (_ BitVec 32) (_ BitVec 64))) (size!21747 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44543)

(declare-fun zeroValueAfter!34 () V!23891)

(declare-fun minValue!754 () V!23891)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9258 0))(
  ( (tuple2!9259 (_1!4640 (_ BitVec 64)) (_2!4640 V!23891)) )
))
(declare-datatypes ((List!15077 0))(
  ( (Nil!15074) (Cons!15073 (h!16208 tuple2!9258) (t!21386 List!15077)) )
))
(declare-datatypes ((ListLongMap!8083 0))(
  ( (ListLongMap!8084 (toList!4057 List!15077)) )
))
(declare-fun lt!364797 () ListLongMap!8083)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2164 (array!44543 array!44541 (_ BitVec 32) (_ BitVec 32) V!23891 V!23891 (_ BitVec 32) Int) ListLongMap!8083)

(assert (=> b!814849 (= lt!364797 (getCurrentListMapNoExtraKeys!2164 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364796 () ListLongMap!8083)

(declare-fun zeroValueBefore!34 () V!23891)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!814849 (= lt!364796 (getCurrentListMapNoExtraKeys!2164 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814850 () Bool)

(declare-fun res!556347 () Bool)

(assert (=> b!814850 (=> (not res!556347) (not e!451691))))

(declare-datatypes ((List!15078 0))(
  ( (Nil!15075) (Cons!15074 (h!16209 (_ BitVec 64)) (t!21387 List!15078)) )
))
(declare-fun arrayNoDuplicates!0 (array!44543 (_ BitVec 32) List!15078) Bool)

(assert (=> b!814850 (= res!556347 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15075))))

(declare-fun mapIsEmpty!22831 () Bool)

(assert (=> mapIsEmpty!22831 mapRes!22831))

(declare-fun res!556348 () Bool)

(assert (=> start!70202 (=> (not res!556348) (not e!451691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70202 (= res!556348 (validMask!0 mask!1312))))

(assert (=> start!70202 e!451691))

(assert (=> start!70202 tp_is_empty!14167))

(declare-fun array_inv!17125 (array!44543) Bool)

(assert (=> start!70202 (array_inv!17125 _keys!976)))

(assert (=> start!70202 true))

(declare-fun array_inv!17126 (array!44541) Bool)

(assert (=> start!70202 (and (array_inv!17126 _values!788) e!451688)))

(assert (=> start!70202 tp!44085))

(declare-fun mapNonEmpty!22831 () Bool)

(declare-fun tp!44086 () Bool)

(declare-fun e!451690 () Bool)

(assert (=> mapNonEmpty!22831 (= mapRes!22831 (and tp!44086 e!451690))))

(declare-fun mapKey!22831 () (_ BitVec 32))

(declare-fun mapValue!22831 () ValueCell!6668)

(declare-fun mapRest!22831 () (Array (_ BitVec 32) ValueCell!6668))

(assert (=> mapNonEmpty!22831 (= (arr!21326 _values!788) (store mapRest!22831 mapKey!22831 mapValue!22831))))

(declare-fun b!814851 () Bool)

(assert (=> b!814851 (= e!451690 tp_is_empty!14167)))

(declare-fun b!814852 () Bool)

(declare-fun res!556346 () Bool)

(assert (=> b!814852 (=> (not res!556346) (not e!451691))))

(assert (=> b!814852 (= res!556346 (and (= (size!21746 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21747 _keys!976) (size!21746 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814853 () Bool)

(declare-fun res!556345 () Bool)

(assert (=> b!814853 (=> (not res!556345) (not e!451691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44543 (_ BitVec 32)) Bool)

(assert (=> b!814853 (= res!556345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70202 res!556348) b!814852))

(assert (= (and b!814852 res!556346) b!814853))

(assert (= (and b!814853 res!556345) b!814850))

(assert (= (and b!814850 res!556347) b!814849))

(assert (= (and b!814848 condMapEmpty!22831) mapIsEmpty!22831))

(assert (= (and b!814848 (not condMapEmpty!22831)) mapNonEmpty!22831))

(get-info :version)

(assert (= (and mapNonEmpty!22831 ((_ is ValueCellFull!6668) mapValue!22831)) b!814851))

(assert (= (and b!814848 ((_ is ValueCellFull!6668) mapDefault!22831)) b!814847))

(assert (= start!70202 b!814848))

(declare-fun m!757143 () Bool)

(assert (=> b!814850 m!757143))

(declare-fun m!757145 () Bool)

(assert (=> b!814849 m!757145))

(declare-fun m!757147 () Bool)

(assert (=> b!814849 m!757147))

(declare-fun m!757149 () Bool)

(assert (=> mapNonEmpty!22831 m!757149))

(declare-fun m!757151 () Bool)

(assert (=> start!70202 m!757151))

(declare-fun m!757153 () Bool)

(assert (=> start!70202 m!757153))

(declare-fun m!757155 () Bool)

(assert (=> start!70202 m!757155))

(declare-fun m!757157 () Bool)

(assert (=> b!814853 m!757157))

(check-sat (not b_next!12457) (not b!814850) tp_is_empty!14167 (not b!814849) (not b!814853) (not start!70202) (not mapNonEmpty!22831) b_and!21239)
(check-sat b_and!21239 (not b_next!12457))
