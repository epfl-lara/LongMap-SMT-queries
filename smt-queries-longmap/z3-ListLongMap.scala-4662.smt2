; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64746 () Bool)

(assert start!64746)

(declare-fun b!730920 () Bool)

(declare-fun e!409008 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!730920 (= e!409008 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!730921 () Bool)

(declare-fun res!491165 () Bool)

(declare-fun e!409015 () Bool)

(assert (=> b!730921 (=> (not res!491165) (not e!409015))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41195 0))(
  ( (array!41196 (arr!19717 (Array (_ BitVec 32) (_ BitVec 64))) (size!20138 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41195)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730921 (= res!491165 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20138 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20138 a!3186))))))

(declare-fun b!730922 () Bool)

(declare-fun res!491171 () Bool)

(declare-fun e!409011 () Bool)

(assert (=> b!730922 (=> (not res!491171) (not e!409011))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730922 (= res!491171 (and (= (size!20138 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20138 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20138 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730923 () Bool)

(declare-fun e!409012 () Bool)

(declare-datatypes ((SeekEntryResult!7317 0))(
  ( (MissingZero!7317 (index!31636 (_ BitVec 32))) (Found!7317 (index!31637 (_ BitVec 32))) (Intermediate!7317 (undefined!8129 Bool) (index!31638 (_ BitVec 32)) (x!62611 (_ BitVec 32))) (Undefined!7317) (MissingVacant!7317 (index!31639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41195 (_ BitVec 32)) SeekEntryResult!7317)

(assert (=> b!730923 (= e!409012 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) (Found!7317 j!159)))))

(declare-fun b!730924 () Bool)

(declare-fun e!409009 () Bool)

(declare-fun e!409014 () Bool)

(assert (=> b!730924 (= e!409009 (not e!409014))))

(declare-fun res!491162 () Bool)

(assert (=> b!730924 (=> res!491162 e!409014)))

(declare-fun lt!323909 () SeekEntryResult!7317)

(get-info :version)

(assert (=> b!730924 (= res!491162 (or (not ((_ is Intermediate!7317) lt!323909)) (bvsge x!1131 (x!62611 lt!323909))))))

(declare-fun e!409016 () Bool)

(assert (=> b!730924 e!409016))

(declare-fun res!491177 () Bool)

(assert (=> b!730924 (=> (not res!491177) (not e!409016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41195 (_ BitVec 32)) Bool)

(assert (=> b!730924 (= res!491177 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24952 0))(
  ( (Unit!24953) )
))
(declare-fun lt!323905 () Unit!24952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24952)

(assert (=> b!730924 (= lt!323905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730925 () Bool)

(declare-fun e!409010 () Bool)

(assert (=> b!730925 (= e!409015 e!409010)))

(declare-fun res!491167 () Bool)

(assert (=> b!730925 (=> (not res!491167) (not e!409010))))

(declare-fun lt!323908 () SeekEntryResult!7317)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41195 (_ BitVec 32)) SeekEntryResult!7317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730925 (= res!491167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19717 a!3186) j!159) mask!3328) (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!323908))))

(assert (=> b!730925 (= lt!323908 (Intermediate!7317 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730926 () Bool)

(declare-fun res!491176 () Bool)

(assert (=> b!730926 (=> (not res!491176) (not e!409011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730926 (= res!491176 (validKeyInArray!0 (select (arr!19717 a!3186) j!159)))))

(declare-fun b!730927 () Bool)

(assert (=> b!730927 (= e!409010 e!409009)))

(declare-fun res!491168 () Bool)

(assert (=> b!730927 (=> (not res!491168) (not e!409009))))

(declare-fun lt!323903 () SeekEntryResult!7317)

(assert (=> b!730927 (= res!491168 (= lt!323903 lt!323909))))

(declare-fun lt!323904 () array!41195)

(declare-fun lt!323901 () (_ BitVec 64))

(assert (=> b!730927 (= lt!323909 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323901 lt!323904 mask!3328))))

(assert (=> b!730927 (= lt!323903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323901 mask!3328) lt!323901 lt!323904 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!730927 (= lt!323901 (select (store (arr!19717 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730927 (= lt!323904 (array!41196 (store (arr!19717 a!3186) i!1173 k0!2102) (size!20138 a!3186)))))

(declare-fun b!730928 () Bool)

(declare-fun res!491173 () Bool)

(assert (=> b!730928 (=> (not res!491173) (not e!409010))))

(assert (=> b!730928 (= res!491173 e!409012)))

(declare-fun c!80254 () Bool)

(assert (=> b!730928 (= c!80254 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730929 () Bool)

(declare-fun res!491169 () Bool)

(assert (=> b!730929 (=> (not res!491169) (not e!409015))))

(declare-datatypes ((List!13719 0))(
  ( (Nil!13716) (Cons!13715 (h!14775 (_ BitVec 64)) (t!20034 List!13719)) )
))
(declare-fun arrayNoDuplicates!0 (array!41195 (_ BitVec 32) List!13719) Bool)

(assert (=> b!730929 (= res!491169 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13716))))

(declare-fun b!730919 () Bool)

(declare-fun e!409007 () Bool)

(declare-fun lt!323906 () SeekEntryResult!7317)

(assert (=> b!730919 (= e!409007 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!323906))))

(declare-fun res!491160 () Bool)

(assert (=> start!64746 (=> (not res!491160) (not e!409011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64746 (= res!491160 (validMask!0 mask!3328))))

(assert (=> start!64746 e!409011))

(assert (=> start!64746 true))

(declare-fun array_inv!15513 (array!41195) Bool)

(assert (=> start!64746 (array_inv!15513 a!3186)))

(declare-fun b!730930 () Bool)

(declare-fun res!491166 () Bool)

(assert (=> b!730930 (=> (not res!491166) (not e!409011))))

(assert (=> b!730930 (= res!491166 (validKeyInArray!0 k0!2102))))

(declare-fun b!730931 () Bool)

(declare-fun res!491174 () Bool)

(assert (=> b!730931 (=> (not res!491174) (not e!409010))))

(assert (=> b!730931 (= res!491174 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19717 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730932 () Bool)

(declare-fun res!491161 () Bool)

(assert (=> b!730932 (=> (not res!491161) (not e!409015))))

(assert (=> b!730932 (= res!491161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730933 () Bool)

(declare-fun res!491170 () Bool)

(assert (=> b!730933 (=> res!491170 e!409008)))

(assert (=> b!730933 (= res!491170 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) (Found!7317 j!159))))))

(declare-fun b!730934 () Bool)

(assert (=> b!730934 (= e!409011 e!409015)))

(declare-fun res!491172 () Bool)

(assert (=> b!730934 (=> (not res!491172) (not e!409015))))

(declare-fun lt!323907 () SeekEntryResult!7317)

(assert (=> b!730934 (= res!491172 (or (= lt!323907 (MissingZero!7317 i!1173)) (= lt!323907 (MissingVacant!7317 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41195 (_ BitVec 32)) SeekEntryResult!7317)

(assert (=> b!730934 (= lt!323907 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730935 () Bool)

(declare-fun res!491175 () Bool)

(assert (=> b!730935 (=> (not res!491175) (not e!409011))))

(declare-fun arrayContainsKey!0 (array!41195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730935 (= res!491175 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730936 () Bool)

(assert (=> b!730936 (= e!409016 e!409007)))

(declare-fun res!491163 () Bool)

(assert (=> b!730936 (=> (not res!491163) (not e!409007))))

(assert (=> b!730936 (= res!491163 (= (seekEntryOrOpen!0 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!323906))))

(assert (=> b!730936 (= lt!323906 (Found!7317 j!159))))

(declare-fun b!730937 () Bool)

(assert (=> b!730937 (= e!409012 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19717 a!3186) j!159) a!3186 mask!3328) lt!323908))))

(declare-fun b!730938 () Bool)

(assert (=> b!730938 (= e!409014 e!409008)))

(declare-fun res!491164 () Bool)

(assert (=> b!730938 (=> res!491164 e!409008)))

(assert (=> b!730938 (= res!491164 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323902 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730938 (= lt!323902 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64746 res!491160) b!730922))

(assert (= (and b!730922 res!491171) b!730926))

(assert (= (and b!730926 res!491176) b!730930))

(assert (= (and b!730930 res!491166) b!730935))

(assert (= (and b!730935 res!491175) b!730934))

(assert (= (and b!730934 res!491172) b!730932))

(assert (= (and b!730932 res!491161) b!730929))

(assert (= (and b!730929 res!491169) b!730921))

(assert (= (and b!730921 res!491165) b!730925))

(assert (= (and b!730925 res!491167) b!730931))

(assert (= (and b!730931 res!491174) b!730928))

(assert (= (and b!730928 c!80254) b!730937))

(assert (= (and b!730928 (not c!80254)) b!730923))

(assert (= (and b!730928 res!491173) b!730927))

(assert (= (and b!730927 res!491168) b!730924))

(assert (= (and b!730924 res!491177) b!730936))

(assert (= (and b!730936 res!491163) b!730919))

(assert (= (and b!730924 (not res!491162)) b!730938))

(assert (= (and b!730938 (not res!491164)) b!730933))

(assert (= (and b!730933 (not res!491170)) b!730920))

(declare-fun m!684379 () Bool)

(assert (=> b!730927 m!684379))

(declare-fun m!684381 () Bool)

(assert (=> b!730927 m!684381))

(declare-fun m!684383 () Bool)

(assert (=> b!730927 m!684383))

(declare-fun m!684385 () Bool)

(assert (=> b!730927 m!684385))

(assert (=> b!730927 m!684385))

(declare-fun m!684387 () Bool)

(assert (=> b!730927 m!684387))

(declare-fun m!684389 () Bool)

(assert (=> b!730938 m!684389))

(declare-fun m!684391 () Bool)

(assert (=> b!730919 m!684391))

(assert (=> b!730919 m!684391))

(declare-fun m!684393 () Bool)

(assert (=> b!730919 m!684393))

(declare-fun m!684395 () Bool)

(assert (=> b!730929 m!684395))

(declare-fun m!684397 () Bool)

(assert (=> b!730932 m!684397))

(assert (=> b!730925 m!684391))

(assert (=> b!730925 m!684391))

(declare-fun m!684399 () Bool)

(assert (=> b!730925 m!684399))

(assert (=> b!730925 m!684399))

(assert (=> b!730925 m!684391))

(declare-fun m!684401 () Bool)

(assert (=> b!730925 m!684401))

(declare-fun m!684403 () Bool)

(assert (=> b!730924 m!684403))

(declare-fun m!684405 () Bool)

(assert (=> b!730924 m!684405))

(assert (=> b!730937 m!684391))

(assert (=> b!730937 m!684391))

(declare-fun m!684407 () Bool)

(assert (=> b!730937 m!684407))

(assert (=> b!730933 m!684391))

(assert (=> b!730933 m!684391))

(declare-fun m!684409 () Bool)

(assert (=> b!730933 m!684409))

(declare-fun m!684411 () Bool)

(assert (=> b!730934 m!684411))

(declare-fun m!684413 () Bool)

(assert (=> b!730931 m!684413))

(assert (=> b!730923 m!684391))

(assert (=> b!730923 m!684391))

(assert (=> b!730923 m!684409))

(declare-fun m!684415 () Bool)

(assert (=> b!730935 m!684415))

(assert (=> b!730936 m!684391))

(assert (=> b!730936 m!684391))

(declare-fun m!684417 () Bool)

(assert (=> b!730936 m!684417))

(assert (=> b!730926 m!684391))

(assert (=> b!730926 m!684391))

(declare-fun m!684419 () Bool)

(assert (=> b!730926 m!684419))

(declare-fun m!684421 () Bool)

(assert (=> start!64746 m!684421))

(declare-fun m!684423 () Bool)

(assert (=> start!64746 m!684423))

(declare-fun m!684425 () Bool)

(assert (=> b!730930 m!684425))

(check-sat (not b!730930) (not b!730934) (not b!730933) (not b!730927) (not b!730937) (not start!64746) (not b!730923) (not b!730919) (not b!730938) (not b!730926) (not b!730924) (not b!730932) (not b!730935) (not b!730925) (not b!730936) (not b!730929))
(check-sat)
