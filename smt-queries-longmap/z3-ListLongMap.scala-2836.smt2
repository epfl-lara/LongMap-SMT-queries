; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40966 () Bool)

(assert start!40966)

(declare-fun b_free!10915 () Bool)

(declare-fun b_next!10915 () Bool)

(assert (=> start!40966 (= b_free!10915 (not b_next!10915))))

(declare-fun tp!38572 () Bool)

(declare-fun b_and!19067 () Bool)

(assert (=> start!40966 (= tp!38572 b_and!19067)))

(declare-fun b!456151 () Bool)

(declare-fun res!272181 () Bool)

(declare-fun e!266554 () Bool)

(assert (=> b!456151 (=> (not res!272181) (not e!266554))))

(declare-datatypes ((array!28300 0))(
  ( (array!28301 (arr!13593 (Array (_ BitVec 32) (_ BitVec 64))) (size!13945 (_ BitVec 32))) )
))
(declare-fun lt!206504 () array!28300)

(declare-datatypes ((List!8113 0))(
  ( (Nil!8110) (Cons!8109 (h!8965 (_ BitVec 64)) (t!13933 List!8113)) )
))
(declare-fun arrayNoDuplicates!0 (array!28300 (_ BitVec 32) List!8113) Bool)

(assert (=> b!456151 (= res!272181 (arrayNoDuplicates!0 lt!206504 #b00000000000000000000000000000000 Nil!8110))))

(declare-fun mapNonEmpty!20020 () Bool)

(declare-fun mapRes!20020 () Bool)

(declare-fun tp!38571 () Bool)

(declare-fun e!266550 () Bool)

(assert (=> mapNonEmpty!20020 (= mapRes!20020 (and tp!38571 e!266550))))

(declare-datatypes ((V!17443 0))(
  ( (V!17444 (val!6171 Int)) )
))
(declare-datatypes ((ValueCell!5783 0))(
  ( (ValueCellFull!5783 (v!8438 V!17443)) (EmptyCell!5783) )
))
(declare-fun mapValue!20020 () ValueCell!5783)

(declare-fun mapKey!20020 () (_ BitVec 32))

(declare-datatypes ((array!28302 0))(
  ( (array!28303 (arr!13594 (Array (_ BitVec 32) ValueCell!5783)) (size!13946 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28302)

(declare-fun mapRest!20020 () (Array (_ BitVec 32) ValueCell!5783))

(assert (=> mapNonEmpty!20020 (= (arr!13594 _values!549) (store mapRest!20020 mapKey!20020 mapValue!20020))))

(declare-fun b!456152 () Bool)

(declare-fun e!266552 () Bool)

(assert (=> b!456152 (= e!266552 e!266554)))

(declare-fun res!272183 () Bool)

(assert (=> b!456152 (=> (not res!272183) (not e!266554))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28300 (_ BitVec 32)) Bool)

(assert (=> b!456152 (= res!272183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206504 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!28300)

(assert (=> b!456152 (= lt!206504 (array!28301 (store (arr!13593 _keys!709) i!563 k0!794) (size!13945 _keys!709)))))

(declare-fun b!456153 () Bool)

(declare-fun res!272179 () Bool)

(assert (=> b!456153 (=> (not res!272179) (not e!266552))))

(declare-fun arrayContainsKey!0 (array!28300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456153 (= res!272179 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20020 () Bool)

(assert (=> mapIsEmpty!20020 mapRes!20020))

(declare-fun b!456154 () Bool)

(declare-fun res!272186 () Bool)

(assert (=> b!456154 (=> (not res!272186) (not e!266552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456154 (= res!272186 (validKeyInArray!0 k0!794))))

(declare-fun b!456155 () Bool)

(declare-fun tp_is_empty!12253 () Bool)

(assert (=> b!456155 (= e!266550 tp_is_empty!12253)))

(declare-fun b!456156 () Bool)

(declare-fun e!266549 () Bool)

(assert (=> b!456156 (= e!266549 tp_is_empty!12253)))

(declare-fun b!456157 () Bool)

(declare-fun res!272178 () Bool)

(assert (=> b!456157 (=> (not res!272178) (not e!266552))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!456157 (= res!272178 (and (= (size!13946 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13945 _keys!709) (size!13946 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456159 () Bool)

(declare-fun e!266551 () Bool)

(assert (=> b!456159 (= e!266551 (and e!266549 mapRes!20020))))

(declare-fun condMapEmpty!20020 () Bool)

(declare-fun mapDefault!20020 () ValueCell!5783)

(assert (=> b!456159 (= condMapEmpty!20020 (= (arr!13594 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5783)) mapDefault!20020)))))

(declare-fun b!456160 () Bool)

(declare-fun res!272182 () Bool)

(assert (=> b!456160 (=> (not res!272182) (not e!266552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456160 (= res!272182 (validMask!0 mask!1025))))

(declare-fun b!456161 () Bool)

(declare-fun res!272185 () Bool)

(assert (=> b!456161 (=> (not res!272185) (not e!266552))))

(assert (=> b!456161 (= res!272185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456162 () Bool)

(declare-fun res!272177 () Bool)

(assert (=> b!456162 (=> (not res!272177) (not e!266552))))

(assert (=> b!456162 (= res!272177 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13945 _keys!709))))))

(declare-fun b!456163 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456163 (= e!266554 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13945 _keys!709)) (bvsge (bvsub (size!13945 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13945 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17443)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8040 0))(
  ( (tuple2!8041 (_1!4031 (_ BitVec 64)) (_2!4031 V!17443)) )
))
(declare-datatypes ((List!8114 0))(
  ( (Nil!8111) (Cons!8110 (h!8966 tuple2!8040) (t!13934 List!8114)) )
))
(declare-datatypes ((ListLongMap!6955 0))(
  ( (ListLongMap!6956 (toList!3493 List!8114)) )
))
(declare-fun lt!206503 () ListLongMap!6955)

(declare-fun zeroValue!515 () V!17443)

(declare-fun v!412 () V!17443)

(declare-fun getCurrentListMapNoExtraKeys!1722 (array!28300 array!28302 (_ BitVec 32) (_ BitVec 32) V!17443 V!17443 (_ BitVec 32) Int) ListLongMap!6955)

(assert (=> b!456163 (= lt!206503 (getCurrentListMapNoExtraKeys!1722 lt!206504 (array!28303 (store (arr!13594 _values!549) i!563 (ValueCellFull!5783 v!412)) (size!13946 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206502 () ListLongMap!6955)

(assert (=> b!456163 (= lt!206502 (getCurrentListMapNoExtraKeys!1722 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456164 () Bool)

(declare-fun res!272180 () Bool)

(assert (=> b!456164 (=> (not res!272180) (not e!266552))))

(assert (=> b!456164 (= res!272180 (or (= (select (arr!13593 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13593 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456165 () Bool)

(declare-fun res!272184 () Bool)

(assert (=> b!456165 (=> (not res!272184) (not e!266552))))

(assert (=> b!456165 (= res!272184 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8110))))

(declare-fun b!456158 () Bool)

(declare-fun res!272188 () Bool)

(assert (=> b!456158 (=> (not res!272188) (not e!266554))))

(assert (=> b!456158 (= res!272188 (bvsle from!863 i!563))))

(declare-fun res!272187 () Bool)

(assert (=> start!40966 (=> (not res!272187) (not e!266552))))

(assert (=> start!40966 (= res!272187 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13945 _keys!709))))))

(assert (=> start!40966 e!266552))

(assert (=> start!40966 tp_is_empty!12253))

(assert (=> start!40966 tp!38572))

(assert (=> start!40966 true))

(declare-fun array_inv!9916 (array!28302) Bool)

(assert (=> start!40966 (and (array_inv!9916 _values!549) e!266551)))

(declare-fun array_inv!9917 (array!28300) Bool)

(assert (=> start!40966 (array_inv!9917 _keys!709)))

(assert (= (and start!40966 res!272187) b!456160))

(assert (= (and b!456160 res!272182) b!456157))

(assert (= (and b!456157 res!272178) b!456161))

(assert (= (and b!456161 res!272185) b!456165))

(assert (= (and b!456165 res!272184) b!456162))

(assert (= (and b!456162 res!272177) b!456154))

(assert (= (and b!456154 res!272186) b!456164))

(assert (= (and b!456164 res!272180) b!456153))

(assert (= (and b!456153 res!272179) b!456152))

(assert (= (and b!456152 res!272183) b!456151))

(assert (= (and b!456151 res!272181) b!456158))

(assert (= (and b!456158 res!272188) b!456163))

(assert (= (and b!456159 condMapEmpty!20020) mapIsEmpty!20020))

(assert (= (and b!456159 (not condMapEmpty!20020)) mapNonEmpty!20020))

(get-info :version)

(assert (= (and mapNonEmpty!20020 ((_ is ValueCellFull!5783) mapValue!20020)) b!456155))

(assert (= (and b!456159 ((_ is ValueCellFull!5783) mapDefault!20020)) b!456156))

(assert (= start!40966 b!456159))

(declare-fun m!439923 () Bool)

(assert (=> b!456152 m!439923))

(declare-fun m!439925 () Bool)

(assert (=> b!456152 m!439925))

(declare-fun m!439927 () Bool)

(assert (=> b!456153 m!439927))

(declare-fun m!439929 () Bool)

(assert (=> start!40966 m!439929))

(declare-fun m!439931 () Bool)

(assert (=> start!40966 m!439931))

(declare-fun m!439933 () Bool)

(assert (=> mapNonEmpty!20020 m!439933))

(declare-fun m!439935 () Bool)

(assert (=> b!456165 m!439935))

(declare-fun m!439937 () Bool)

(assert (=> b!456151 m!439937))

(declare-fun m!439939 () Bool)

(assert (=> b!456160 m!439939))

(declare-fun m!439941 () Bool)

(assert (=> b!456163 m!439941))

(declare-fun m!439943 () Bool)

(assert (=> b!456163 m!439943))

(declare-fun m!439945 () Bool)

(assert (=> b!456163 m!439945))

(declare-fun m!439947 () Bool)

(assert (=> b!456154 m!439947))

(declare-fun m!439949 () Bool)

(assert (=> b!456164 m!439949))

(declare-fun m!439951 () Bool)

(assert (=> b!456161 m!439951))

(check-sat (not start!40966) (not mapNonEmpty!20020) (not b!456160) (not b!456161) (not b!456152) (not b!456165) tp_is_empty!12253 (not b!456154) (not b!456163) (not b_next!10915) (not b!456151) b_and!19067 (not b!456153))
(check-sat b_and!19067 (not b_next!10915))
