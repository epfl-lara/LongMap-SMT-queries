; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20720 () Bool)

(assert start!20720)

(declare-fun b_free!5379 () Bool)

(declare-fun b_next!5379 () Bool)

(assert (=> start!20720 (= b_free!5379 (not b_next!5379))))

(declare-fun tp!19169 () Bool)

(declare-fun b_and!12125 () Bool)

(assert (=> start!20720 (= tp!19169 b_and!12125)))

(declare-fun b!207296 () Bool)

(declare-fun res!100612 () Bool)

(declare-fun e!135359 () Bool)

(assert (=> b!207296 (=> (not res!100612) (not e!135359))))

(declare-datatypes ((array!9679 0))(
  ( (array!9680 (arr!4590 (Array (_ BitVec 32) (_ BitVec 64))) (size!4915 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9679)

(declare-datatypes ((List!2932 0))(
  ( (Nil!2929) (Cons!2928 (h!3570 (_ BitVec 64)) (t!7863 List!2932)) )
))
(declare-fun arrayNoDuplicates!0 (array!9679 (_ BitVec 32) List!2932) Bool)

(assert (=> b!207296 (= res!100612 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2929))))

(declare-fun b!207297 () Bool)

(assert (=> b!207297 (= e!135359 (not true))))

(declare-datatypes ((V!6627 0))(
  ( (V!6628 (val!2662 Int)) )
))
(declare-datatypes ((ValueCell!2274 0))(
  ( (ValueCellFull!2274 (v!4632 V!6627)) (EmptyCell!2274) )
))
(declare-datatypes ((array!9681 0))(
  ( (array!9682 (arr!4591 (Array (_ BitVec 32) ValueCell!2274)) (size!4916 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9681)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4042 0))(
  ( (tuple2!4043 (_1!2032 (_ BitVec 64)) (_2!2032 V!6627)) )
))
(declare-datatypes ((List!2933 0))(
  ( (Nil!2930) (Cons!2929 (h!3571 tuple2!4042) (t!7864 List!2933)) )
))
(declare-datatypes ((ListLongMap!2955 0))(
  ( (ListLongMap!2956 (toList!1493 List!2933)) )
))
(declare-fun lt!106179 () ListLongMap!2955)

(declare-fun zeroValue!615 () V!6627)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6627)

(declare-fun getCurrentListMap!1060 (array!9679 array!9681 (_ BitVec 32) (_ BitVec 32) V!6627 V!6627 (_ BitVec 32) Int) ListLongMap!2955)

(assert (=> b!207297 (= lt!106179 (getCurrentListMap!1060 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106185 () array!9681)

(declare-fun lt!106182 () ListLongMap!2955)

(assert (=> b!207297 (= lt!106182 (getCurrentListMap!1060 _keys!825 lt!106185 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106183 () ListLongMap!2955)

(declare-fun lt!106180 () ListLongMap!2955)

(assert (=> b!207297 (and (= lt!106183 lt!106180) (= lt!106180 lt!106183))))

(declare-fun lt!106184 () ListLongMap!2955)

(declare-fun v!520 () V!6627)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!520 (ListLongMap!2955 tuple2!4042) ListLongMap!2955)

(assert (=> b!207297 (= lt!106180 (+!520 lt!106184 (tuple2!4043 k0!843 v!520)))))

(declare-datatypes ((Unit!6328 0))(
  ( (Unit!6329) )
))
(declare-fun lt!106181 () Unit!6328)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!173 (array!9679 array!9681 (_ BitVec 32) (_ BitVec 32) V!6627 V!6627 (_ BitVec 32) (_ BitVec 64) V!6627 (_ BitVec 32) Int) Unit!6328)

(assert (=> b!207297 (= lt!106181 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!173 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!434 (array!9679 array!9681 (_ BitVec 32) (_ BitVec 32) V!6627 V!6627 (_ BitVec 32) Int) ListLongMap!2955)

(assert (=> b!207297 (= lt!106183 (getCurrentListMapNoExtraKeys!434 _keys!825 lt!106185 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207297 (= lt!106185 (array!9682 (store (arr!4591 _values!649) i!601 (ValueCellFull!2274 v!520)) (size!4916 _values!649)))))

(assert (=> b!207297 (= lt!106184 (getCurrentListMapNoExtraKeys!434 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207298 () Bool)

(declare-fun res!100610 () Bool)

(assert (=> b!207298 (=> (not res!100610) (not e!135359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9679 (_ BitVec 32)) Bool)

(assert (=> b!207298 (= res!100610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8921 () Bool)

(declare-fun mapRes!8921 () Bool)

(assert (=> mapIsEmpty!8921 mapRes!8921))

(declare-fun b!207299 () Bool)

(declare-fun e!135357 () Bool)

(declare-fun tp_is_empty!5235 () Bool)

(assert (=> b!207299 (= e!135357 tp_is_empty!5235)))

(declare-fun res!100607 () Bool)

(assert (=> start!20720 (=> (not res!100607) (not e!135359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20720 (= res!100607 (validMask!0 mask!1149))))

(assert (=> start!20720 e!135359))

(declare-fun e!135356 () Bool)

(declare-fun array_inv!3039 (array!9681) Bool)

(assert (=> start!20720 (and (array_inv!3039 _values!649) e!135356)))

(assert (=> start!20720 true))

(assert (=> start!20720 tp_is_empty!5235))

(declare-fun array_inv!3040 (array!9679) Bool)

(assert (=> start!20720 (array_inv!3040 _keys!825)))

(assert (=> start!20720 tp!19169))

(declare-fun b!207300 () Bool)

(declare-fun res!100606 () Bool)

(assert (=> b!207300 (=> (not res!100606) (not e!135359))))

(assert (=> b!207300 (= res!100606 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4915 _keys!825))))))

(declare-fun b!207301 () Bool)

(declare-fun res!100608 () Bool)

(assert (=> b!207301 (=> (not res!100608) (not e!135359))))

(assert (=> b!207301 (= res!100608 (= (select (arr!4590 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8921 () Bool)

(declare-fun tp!19168 () Bool)

(declare-fun e!135358 () Bool)

(assert (=> mapNonEmpty!8921 (= mapRes!8921 (and tp!19168 e!135358))))

(declare-fun mapKey!8921 () (_ BitVec 32))

(declare-fun mapRest!8921 () (Array (_ BitVec 32) ValueCell!2274))

(declare-fun mapValue!8921 () ValueCell!2274)

(assert (=> mapNonEmpty!8921 (= (arr!4591 _values!649) (store mapRest!8921 mapKey!8921 mapValue!8921))))

(declare-fun b!207302 () Bool)

(declare-fun res!100609 () Bool)

(assert (=> b!207302 (=> (not res!100609) (not e!135359))))

(assert (=> b!207302 (= res!100609 (and (= (size!4916 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4915 _keys!825) (size!4916 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207303 () Bool)

(assert (=> b!207303 (= e!135358 tp_is_empty!5235)))

(declare-fun b!207304 () Bool)

(declare-fun res!100611 () Bool)

(assert (=> b!207304 (=> (not res!100611) (not e!135359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207304 (= res!100611 (validKeyInArray!0 k0!843))))

(declare-fun b!207305 () Bool)

(assert (=> b!207305 (= e!135356 (and e!135357 mapRes!8921))))

(declare-fun condMapEmpty!8921 () Bool)

(declare-fun mapDefault!8921 () ValueCell!2274)

(assert (=> b!207305 (= condMapEmpty!8921 (= (arr!4591 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2274)) mapDefault!8921)))))

(assert (= (and start!20720 res!100607) b!207302))

(assert (= (and b!207302 res!100609) b!207298))

(assert (= (and b!207298 res!100610) b!207296))

(assert (= (and b!207296 res!100612) b!207300))

(assert (= (and b!207300 res!100606) b!207304))

(assert (= (and b!207304 res!100611) b!207301))

(assert (= (and b!207301 res!100608) b!207297))

(assert (= (and b!207305 condMapEmpty!8921) mapIsEmpty!8921))

(assert (= (and b!207305 (not condMapEmpty!8921)) mapNonEmpty!8921))

(get-info :version)

(assert (= (and mapNonEmpty!8921 ((_ is ValueCellFull!2274) mapValue!8921)) b!207303))

(assert (= (and b!207305 ((_ is ValueCellFull!2274) mapDefault!8921)) b!207299))

(assert (= start!20720 b!207305))

(declare-fun m!235039 () Bool)

(assert (=> b!207304 m!235039))

(declare-fun m!235041 () Bool)

(assert (=> mapNonEmpty!8921 m!235041))

(declare-fun m!235043 () Bool)

(assert (=> start!20720 m!235043))

(declare-fun m!235045 () Bool)

(assert (=> start!20720 m!235045))

(declare-fun m!235047 () Bool)

(assert (=> start!20720 m!235047))

(declare-fun m!235049 () Bool)

(assert (=> b!207297 m!235049))

(declare-fun m!235051 () Bool)

(assert (=> b!207297 m!235051))

(declare-fun m!235053 () Bool)

(assert (=> b!207297 m!235053))

(declare-fun m!235055 () Bool)

(assert (=> b!207297 m!235055))

(declare-fun m!235057 () Bool)

(assert (=> b!207297 m!235057))

(declare-fun m!235059 () Bool)

(assert (=> b!207297 m!235059))

(declare-fun m!235061 () Bool)

(assert (=> b!207297 m!235061))

(declare-fun m!235063 () Bool)

(assert (=> b!207298 m!235063))

(declare-fun m!235065 () Bool)

(assert (=> b!207296 m!235065))

(declare-fun m!235067 () Bool)

(assert (=> b!207301 m!235067))

(check-sat b_and!12125 (not b!207296) (not start!20720) (not mapNonEmpty!8921) (not b!207304) (not b!207298) (not b_next!5379) tp_is_empty!5235 (not b!207297))
(check-sat b_and!12125 (not b_next!5379))
