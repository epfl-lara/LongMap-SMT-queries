; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39704 () Bool)

(assert start!39704)

(declare-fun b_free!9985 () Bool)

(declare-fun b_next!9985 () Bool)

(assert (=> start!39704 (= b_free!9985 (not b_next!9985))))

(declare-fun tp!35484 () Bool)

(declare-fun b_and!17655 () Bool)

(assert (=> start!39704 (= tp!35484 b_and!17655)))

(declare-fun b!427006 () Bool)

(declare-fun res!250396 () Bool)

(declare-fun e!253238 () Bool)

(assert (=> b!427006 (=> (not res!250396) (not e!253238))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26120 0))(
  ( (array!26121 (arr!12509 (Array (_ BitVec 32) (_ BitVec 64))) (size!12861 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26120)

(assert (=> b!427006 (= res!250396 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12861 _keys!709))))))

(declare-fun b!427007 () Bool)

(declare-fun e!253241 () Bool)

(declare-fun tp_is_empty!11137 () Bool)

(assert (=> b!427007 (= e!253241 tp_is_empty!11137)))

(declare-fun b!427008 () Bool)

(declare-fun e!253242 () Bool)

(assert (=> b!427008 (= e!253238 e!253242)))

(declare-fun res!250401 () Bool)

(assert (=> b!427008 (=> (not res!250401) (not e!253242))))

(declare-fun lt!195173 () array!26120)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26120 (_ BitVec 32)) Bool)

(assert (=> b!427008 (= res!250401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195173 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!427008 (= lt!195173 (array!26121 (store (arr!12509 _keys!709) i!563 k0!794) (size!12861 _keys!709)))))

(declare-fun mapIsEmpty!18327 () Bool)

(declare-fun mapRes!18327 () Bool)

(assert (=> mapIsEmpty!18327 mapRes!18327))

(declare-fun b!427009 () Bool)

(declare-fun e!253237 () Bool)

(assert (=> b!427009 (= e!253242 e!253237)))

(declare-fun res!250406 () Bool)

(assert (=> b!427009 (=> (not res!250406) (not e!253237))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427009 (= res!250406 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15955 0))(
  ( (V!15956 (val!5613 Int)) )
))
(declare-fun minValue!515 () V!15955)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15955)

(declare-datatypes ((ValueCell!5225 0))(
  ( (ValueCellFull!5225 (v!7861 V!15955)) (EmptyCell!5225) )
))
(declare-datatypes ((array!26122 0))(
  ( (array!26123 (arr!12510 (Array (_ BitVec 32) ValueCell!5225)) (size!12862 (_ BitVec 32))) )
))
(declare-fun lt!195177 () array!26122)

(declare-datatypes ((tuple2!7276 0))(
  ( (tuple2!7277 (_1!3649 (_ BitVec 64)) (_2!3649 V!15955)) )
))
(declare-datatypes ((List!7279 0))(
  ( (Nil!7276) (Cons!7275 (h!8131 tuple2!7276) (t!12715 List!7279)) )
))
(declare-datatypes ((ListLongMap!6191 0))(
  ( (ListLongMap!6192 (toList!3111 List!7279)) )
))
(declare-fun lt!195176 () ListLongMap!6191)

(declare-fun getCurrentListMapNoExtraKeys!1357 (array!26120 array!26122 (_ BitVec 32) (_ BitVec 32) V!15955 V!15955 (_ BitVec 32) Int) ListLongMap!6191)

(assert (=> b!427009 (= lt!195176 (getCurrentListMapNoExtraKeys!1357 lt!195173 lt!195177 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26122)

(declare-fun v!412 () V!15955)

(assert (=> b!427009 (= lt!195177 (array!26123 (store (arr!12510 _values!549) i!563 (ValueCellFull!5225 v!412)) (size!12862 _values!549)))))

(declare-fun lt!195175 () ListLongMap!6191)

(assert (=> b!427009 (= lt!195175 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427010 () Bool)

(declare-fun res!250397 () Bool)

(assert (=> b!427010 (=> (not res!250397) (not e!253242))))

(declare-datatypes ((List!7280 0))(
  ( (Nil!7277) (Cons!7276 (h!8132 (_ BitVec 64)) (t!12716 List!7280)) )
))
(declare-fun arrayNoDuplicates!0 (array!26120 (_ BitVec 32) List!7280) Bool)

(assert (=> b!427010 (= res!250397 (arrayNoDuplicates!0 lt!195173 #b00000000000000000000000000000000 Nil!7277))))

(declare-fun b!427011 () Bool)

(declare-fun res!250404 () Bool)

(assert (=> b!427011 (=> (not res!250404) (not e!253238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427011 (= res!250404 (validMask!0 mask!1025))))

(declare-fun b!427012 () Bool)

(declare-fun res!250402 () Bool)

(assert (=> b!427012 (=> (not res!250402) (not e!253242))))

(assert (=> b!427012 (= res!250402 (bvsle from!863 i!563))))

(declare-fun b!427013 () Bool)

(declare-fun res!250405 () Bool)

(assert (=> b!427013 (=> (not res!250405) (not e!253238))))

(assert (=> b!427013 (= res!250405 (and (= (size!12862 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12861 _keys!709) (size!12862 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427014 () Bool)

(declare-fun res!250395 () Bool)

(assert (=> b!427014 (=> (not res!250395) (not e!253238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427014 (= res!250395 (validKeyInArray!0 k0!794))))

(declare-fun res!250399 () Bool)

(assert (=> start!39704 (=> (not res!250399) (not e!253238))))

(assert (=> start!39704 (= res!250399 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12861 _keys!709))))))

(assert (=> start!39704 e!253238))

(assert (=> start!39704 tp_is_empty!11137))

(assert (=> start!39704 tp!35484))

(assert (=> start!39704 true))

(declare-fun e!253240 () Bool)

(declare-fun array_inv!9182 (array!26122) Bool)

(assert (=> start!39704 (and (array_inv!9182 _values!549) e!253240)))

(declare-fun array_inv!9183 (array!26120) Bool)

(assert (=> start!39704 (array_inv!9183 _keys!709)))

(declare-fun b!427015 () Bool)

(declare-fun res!250400 () Bool)

(assert (=> b!427015 (=> (not res!250400) (not e!253238))))

(assert (=> b!427015 (= res!250400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427016 () Bool)

(declare-fun res!250407 () Bool)

(assert (=> b!427016 (=> (not res!250407) (not e!253238))))

(declare-fun arrayContainsKey!0 (array!26120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427016 (= res!250407 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427017 () Bool)

(declare-fun res!250398 () Bool)

(assert (=> b!427017 (=> (not res!250398) (not e!253238))))

(assert (=> b!427017 (= res!250398 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7277))))

(declare-fun b!427018 () Bool)

(declare-fun res!250403 () Bool)

(assert (=> b!427018 (=> (not res!250403) (not e!253238))))

(assert (=> b!427018 (= res!250403 (or (= (select (arr!12509 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12509 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18327 () Bool)

(declare-fun tp!35483 () Bool)

(declare-fun e!253243 () Bool)

(assert (=> mapNonEmpty!18327 (= mapRes!18327 (and tp!35483 e!253243))))

(declare-fun mapValue!18327 () ValueCell!5225)

(declare-fun mapKey!18327 () (_ BitVec 32))

(declare-fun mapRest!18327 () (Array (_ BitVec 32) ValueCell!5225))

(assert (=> mapNonEmpty!18327 (= (arr!12510 _values!549) (store mapRest!18327 mapKey!18327 mapValue!18327))))

(declare-fun b!427019 () Bool)

(assert (=> b!427019 (= e!253237 (not true))))

(declare-fun +!1324 (ListLongMap!6191 tuple2!7276) ListLongMap!6191)

(assert (=> b!427019 (= (getCurrentListMapNoExtraKeys!1357 lt!195173 lt!195177 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1324 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7277 k0!794 v!412)))))

(declare-datatypes ((Unit!12523 0))(
  ( (Unit!12524) )
))
(declare-fun lt!195174 () Unit!12523)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!508 (array!26120 array!26122 (_ BitVec 32) (_ BitVec 32) V!15955 V!15955 (_ BitVec 32) (_ BitVec 64) V!15955 (_ BitVec 32) Int) Unit!12523)

(assert (=> b!427019 (= lt!195174 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427020 () Bool)

(assert (=> b!427020 (= e!253243 tp_is_empty!11137)))

(declare-fun b!427021 () Bool)

(assert (=> b!427021 (= e!253240 (and e!253241 mapRes!18327))))

(declare-fun condMapEmpty!18327 () Bool)

(declare-fun mapDefault!18327 () ValueCell!5225)

(assert (=> b!427021 (= condMapEmpty!18327 (= (arr!12510 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5225)) mapDefault!18327)))))

(assert (= (and start!39704 res!250399) b!427011))

(assert (= (and b!427011 res!250404) b!427013))

(assert (= (and b!427013 res!250405) b!427015))

(assert (= (and b!427015 res!250400) b!427017))

(assert (= (and b!427017 res!250398) b!427006))

(assert (= (and b!427006 res!250396) b!427014))

(assert (= (and b!427014 res!250395) b!427018))

(assert (= (and b!427018 res!250403) b!427016))

(assert (= (and b!427016 res!250407) b!427008))

(assert (= (and b!427008 res!250401) b!427010))

(assert (= (and b!427010 res!250397) b!427012))

(assert (= (and b!427012 res!250402) b!427009))

(assert (= (and b!427009 res!250406) b!427019))

(assert (= (and b!427021 condMapEmpty!18327) mapIsEmpty!18327))

(assert (= (and b!427021 (not condMapEmpty!18327)) mapNonEmpty!18327))

(get-info :version)

(assert (= (and mapNonEmpty!18327 ((_ is ValueCellFull!5225) mapValue!18327)) b!427020))

(assert (= (and b!427021 ((_ is ValueCellFull!5225) mapDefault!18327)) b!427007))

(assert (= start!39704 b!427021))

(declare-fun m!415835 () Bool)

(assert (=> b!427018 m!415835))

(declare-fun m!415837 () Bool)

(assert (=> b!427008 m!415837))

(declare-fun m!415839 () Bool)

(assert (=> b!427008 m!415839))

(declare-fun m!415841 () Bool)

(assert (=> b!427014 m!415841))

(declare-fun m!415843 () Bool)

(assert (=> b!427010 m!415843))

(declare-fun m!415845 () Bool)

(assert (=> b!427016 m!415845))

(declare-fun m!415847 () Bool)

(assert (=> b!427015 m!415847))

(declare-fun m!415849 () Bool)

(assert (=> b!427009 m!415849))

(declare-fun m!415851 () Bool)

(assert (=> b!427009 m!415851))

(declare-fun m!415853 () Bool)

(assert (=> b!427009 m!415853))

(declare-fun m!415855 () Bool)

(assert (=> b!427011 m!415855))

(declare-fun m!415857 () Bool)

(assert (=> mapNonEmpty!18327 m!415857))

(declare-fun m!415859 () Bool)

(assert (=> b!427017 m!415859))

(declare-fun m!415861 () Bool)

(assert (=> start!39704 m!415861))

(declare-fun m!415863 () Bool)

(assert (=> start!39704 m!415863))

(declare-fun m!415865 () Bool)

(assert (=> b!427019 m!415865))

(declare-fun m!415867 () Bool)

(assert (=> b!427019 m!415867))

(assert (=> b!427019 m!415867))

(declare-fun m!415869 () Bool)

(assert (=> b!427019 m!415869))

(declare-fun m!415871 () Bool)

(assert (=> b!427019 m!415871))

(check-sat (not b!427019) (not b!427015) b_and!17655 (not b!427014) (not b!427008) (not start!39704) (not b!427010) (not mapNonEmpty!18327) (not b_next!9985) (not b!427016) (not b!427011) (not b!427009) (not b!427017) tp_is_empty!11137)
(check-sat b_and!17655 (not b_next!9985))
